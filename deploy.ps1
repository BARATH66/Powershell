param (
    [string]$emptyIspacPath,     # Path to empty .ispac file
    [string]$fullIspacPath,      # Path to full .ispac file
    [string]$extractPath,        # Destination path for extraction
    [string]$serverName,         # SQL Server name
    [string]$databaseName,       # SSIS Database name (usually "SSISDB")
    [string]$username,           # SQL Username (if using SQL Auth)
    [string]$password,           # SQL Password (if using SQL Auth)
    [string]$prefixes,           # Package prefixes for filtering
    [string]$folderName,         # SSIS Folder name
    [string]$projectName         # SSIS Project name
)

# Function to execute SQL script
function Execute-Sql {
    param ([string]$query)
    
    if ($username -and $password) {
        # SQL Authentication
        Invoke-Sqlcmd -ServerInstance $serverName -Database $databaseName -Username $username -Password $password -Query $query
    } else {
        # Windows Authentication
        Invoke-Sqlcmd -ServerInstance $serverName -Database $databaseName -Query $query
    }
}

Write-Host "Deploying Empty SSIS Project..."

# Deploy Empty ISPAC First
if (Test-Path $emptyIspacPath) {
    $deployQuery = @"
DECLARE @folder_name NVARCHAR(128) = '$folderName';
DECLARE @project_name NVARCHAR(128) = '$projectName';
DECLARE @ispac VARBINARY(MAX);

-- Read the empty ISPAC file
SELECT @ispac = CAST(BulkColumn AS VARBINARY(MAX))
FROM OPENROWSET(BULK '$emptyIspacPath', SINGLE_BLOB) AS x;

-- Create the folder if it doesn't exist
IF NOT EXISTS (SELECT 1 FROM SSISDB.catalog.folders WHERE name = @folder_name)
BEGIN
    EXEC SSISDB.catalog.create_folder @folder_name, null;
END;

-- Deploy the empty project
EXEC SSISDB.catalog.deploy_project @folder_name, @project_name, @ispac;
"@
    Execute-Sql -query $deployQuery
    Write-Host "Empty SSIS Project Deployed Successfully!"
} else {
    Write-Host "Error: Empty ISPAC file not found at $emptyIspacPath"
    exit 1
}

# Ensure extract path exists
if (!(Test-Path $extractPath)) {
    New-Item -ItemType Directory -Path $extractPath -Force
}

Write-Host "Extracting Full ISPAC File..."

# Ensure the full ISPAC file exists before renaming
if (Test-Path $fullIspacPath) {
    $zipPath = "$extractPath\$projectName.zip"

    # Ensure any existing zip file is removed
    if (Test-Path $zipPath) { Remove-Item -Path $zipPath -Force }

    # Rename .ispac to .zip properly
   ## Move-Item -Path $fullIspacPath -Destination $zipPath -Force
	Copy-Item -Path $fullIspacPath -Destination $zipPath -Force
    Write-Host "Renamed ISPAC to ZIP: $zipPath"

    # Extract ZIP
    Expand-Archive -Path $zipPath -DestinationPath $extractPath -Force
    Write-Host "Extraction Completed!"
} else {
    Write-Host "Error: The full ISPAC file does not exist at $fullIspacPath"
    exit 1
}

Write-Host "Filtering and Deploying Packages..."

# SQL Query to process and filter .dtsx files
$deployPackagesQuery = @"
DECLARE @folder_name NVARCHAR(128) = '$folderName';
DECLARE @project_name NVARCHAR(128) = '$projectName';
DECLARE @prefixes NVARCHAR(MAX) = '$prefixes';

DECLARE @cmd NVARCHAR(MAX);
SET @cmd = 'dir /b "$extractPath\*.dtsx"';

-- Enable xp_cmdshell if needed
EXEC sp_configure 'show advanced options', 1; RECONFIGURE;
EXEC sp_configure 'xp_cmdshell', 1; RECONFIGURE;

-- Drop temp tables if they exist
IF OBJECT_ID('tempdb..#FileList') IS NOT NULL DROP TABLE #FileList;
IF OBJECT_ID('tempdb..#MatchingFiles') IS NOT NULL DROP TABLE #MatchingFiles;
IF OBJECT_ID('tempdb..#DebugLog') IS NOT NULL DROP TABLE #DebugLog;
IF OBJECT_ID('tempdb..#TempPackageList') IS NOT NULL DROP TABLE #TempPackageList;

-- Create temp tables
CREATE TABLE #FileList (FileName NVARCHAR(255));
CREATE TABLE #DebugLog (Step NVARCHAR(255), FileName NVARCHAR(255), BulkData VARBINARY(MAX));
CREATE TABLE #TempPackageList (name NVARCHAR(255), package_data VARBINARY(MAX));

-- Get file names from directory
INSERT INTO #FileList (FileName) EXEC ('xp_cmdshell ''' + @cmd + '''');

-- Remove NULLs from xp_cmdshell output
DELETE FROM #FileList WHERE FileName IS NULL;

-- Create table for matching files
CREATE TABLE #MatchingFiles (FileName NVARCHAR(255));

INSERT INTO #MatchingFiles (FileName)
SELECT FileName FROM #FileList 
WHERE EXISTS (
    SELECT 1 
    FROM STRING_SPLIT(@prefixes, ',') AS PrefixList
    WHERE FileName LIKE PrefixList.[value] + '%.dtsx'
);

-- Close and Deallocate cursor if it already exists
IF CURSOR_STATUS('global', 'file_cursor') >= 0  
BEGIN  
    CLOSE file_cursor;
    DEALLOCATE file_cursor;
END  

-- Table-valued parameter for deployment
DECLARE @package_list AS catalog.Package_Table_Type;  

DECLARE @FileName NVARCHAR(255);
DECLARE @SQL NVARCHAR(MAX);

DECLARE file_cursor CURSOR FOR 
SELECT FileName FROM #MatchingFiles;  

OPEN file_cursor;
FETCH NEXT FROM file_cursor INTO @FileName;

WHILE @@FETCH_STATUS = 0
BEGIN
    -- Read each .dtsx file into temp table
    SET @SQL = N'
        INSERT INTO #TempPackageList (name, package_data)
        SELECT @FileName, BulkColumn
        FROM OPENROWSET(BULK N''$extractPath\' + @FileName + ''', SINGLE_BLOB) AS FileData;
    ';

    EXEC sp_executesql @SQL, N'@FileName NVARCHAR(255)', @FileName;

    -- Log inserted data
    INSERT INTO #DebugLog (Step, FileName, BulkData)
    SELECT 'Inserted', name, package_data FROM #TempPackageList;

    FETCH NEXT FROM file_cursor INTO @FileName;
END

CLOSE file_cursor;
DEALLOCATE file_cursor;

-- Insert from temp table into TVP
INSERT INTO @package_list (name, package_data)
SELECT name, package_data FROM #TempPackageList;

-- Debugging: Check Debug Log Table
SELECT * FROM #DebugLog;

-- Deploy packages
DECLARE @operation_id BIGINT;
EXEC [catalog].[deploy_packages]  
    @folder_name = @folder_name,  
    @project_name = @project_name,  
    @packages_table = @package_list,  
    @operation_id = @operation_id OUTPUT;

SELECT @operation_id AS OperationID;
"@

Execute-Sql -query $deployPackagesQuery

Write-Host "SSIS Package Deployment Completed Successfully!"



if (Test-Path $extractPath) {
    Remove-Item -Path "$extractPath\*" -Recurse -Force
    Write-Host "Extracted files deleted successfully!"
} else {
    Write-Host "No extracted files found to delete."
}


