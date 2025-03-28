param(
    [string]$zipFilePath,
    [string]$parentFolder,
    [string]$username,
    [string]$password,
    [string]$serviceUrl,
    [string]$reportUrl
)

import-Module ReportingServicesTools

# Helper function to convert password to secure string
function Get-CredentialObject {
    param (
        [string]$username,
        [string]$password
    )
    $securePassword = ConvertTo-SecureString $password -AsPlainText -Force
    return New-Object System.Management.Automation.PSCredential ($username, $securePassword)
}

# Function to check if a folder exists
function Test-FolderExists {
    param (
        [string]$fullPath,
        [string]$reportServerUrl,
		[PSCredential]$credential
    )
    try {
		$path = ""
		if($fullPath[$fullPath.Length-1] -eq "\"){
			$path = $fullPath.SubString(0, $fullPath.Length-1)
		}
		else{
			$path = $fullPath
		}
		
        Get-RsRestItem -RsItem $path  -ReportPortalUri $reportServerUrl  -Credential $credential
        return $true
    }
    catch {
		Write-Host "Error occurred while checking folder existence: $($_.Exception.Message)"
        return $false
    }
}



# Function to create a new folder path like "/Domain/safety"
function New-FolderPath {
    param (
        [string]$reportServerUrl,
        [string]$folderPath,
        [PSCredential]$cred
    )
	
    $parentFolders = if ($folderPath[0] -eq "\") {
        $folderPath.Substring(1).Split("\")
    } else {
        $folderPath.Split("\")
    }
	
    $path = "/"
    foreach ($folder in $parentFolders) {
		
        $basepath = "$path$folder"
		Write-Host "Is this path exists in the server :: $basepath"
		Write-Host "---------------------------------------------"
		$isExists = Test-FolderExists -fullPath $basepath -reportServerUrl $reportServerUrl -credential $cred
		Write-Host "---------------------$isExists------------------------"
        if ($isExists -eq $false) {
			if($path -eq "/"){
				# Creating folder in home page of the server
				#New-RsFolder -Path "/" -FolderName $folder -ReportServerUri $reportServerUrl -Credential $cred
				New-RsRestFolder -FolderName $folder -RsFolder "/" -ReportPortalUri $reportServerUrl -Credential $cred
			}
			else{
				$normalizedPath = ""
				if($path[$path.Length-1] -eq "/"){
					$normalizedPath = $path.SubString(0, $path.Length-1)
					
				}else{
					$normalizedPath = $path
				}
				Write-Host "Normalized path to upload PBIX ::: $normalizedPath"
				# Creating subfolders 
				#New-RsFolder -Path $normalizedPath -FolderName $folder -ReportServerUri $reportServerUrl -Credential $cred
				New-RsRestFolder -FolderName $folder -RsFolder $normalizedPath -ReportPortalUri $reportServerUrl -Credential $cred
			}
			
        }
        $path = "$basepath/"
    }
    Write-Host "$folderPath is created successfully"
}

# Function to upload PBIX files
function Upload-PBIXFiles {
    param (
        [string]$folderPath,
        [string]$reportServer,
        [string]$pbixFilesPath,
        [string]$pbiReportUrl,
        [PSCredential]$cred
    )

    $fullPath = $folderPath -replace '\\', '/'
    $session = New-RsRestSession -ReportPortalUri $pbiReportUrl -Credential $cred
    $reportServerUri = "$reportServer/ReportService2010.asmx"

    if (-not (Test-FolderExists -fullPath "/$fullPath" -reportServerUrl $pbiReportUrl -credential $cred)) {
		$path = ""
		if($folderPath[$folderPath.Length-1] -eq "/"){
			$path = $folderPath.SubString(0, $folderPath.Length-1)
		}
		else{
			$path = $folderPath
		}
		
        New-FolderPath -reportServerUrl $pbiReportUrl -folderPath $path -cred $cred
		
    }
	write-Host "Get Child items from $pbixFilesPath"
    $pbixFiles = Get-ChildItem -Path $pbixFilesPath -Filter *.pbix
    foreach ($pbixFile in $pbixFiles) {
        $fileName = $pbixFile.Name
        $reportName = $fileName.Substring(0, $fileName.IndexOf("."))
		write-Host "Report Server $reportServer  and Path  $fullPath "
		write-Host "Report to upload : $reportName "
		$isReportExists = Test-FolderExists -fullPath "$fullPath/$reportName" -reportServerUrl $pbiReportUrl -credential $cred
		
        if ($isReportExists) {
			Write-Host "Report $reportName is present"
            Remove-RsRestCatalogItem -WebSession $session -RsItem "$fullPath/$reportName" -ReportPortalUri $pbiReportUrl -Confirm:$false -Credential $cred
        }
		try{
			Write-Host "Attempting to upload $reportName .... in  $fullPath"
			Write-RsRestCatalogItem -WebSession $session -Path $pbixFile.FullName -RsFolder "$fullPath" -Overwrite
			Write-Host "$reportName uploaded successfully!!"
		}catch{
			Write-Error "Error: $($_.Exception.Message)"
		}
		
        $reportFullPath = "/$fullPath/$reportName"
        $dataSource = Get-RsRestItemDataSource -WebSession $session -RsItem $reportFullPath
        $dataSource.DataModelDataSource.AuthType = "Windows"
        $dataSource.CredentialRetrieval = "Store"
        $dataSource.DataModelDataSource.UserName = $cred.UserName
        $dataSource.DataModelDataSource.Secret = $password
        Set-RsRestItemDataSource -WebSession $session -RsItem $reportFullPath -RsItemType "PowerBIReport" -DataSources $dataSource
    }
    
}

# Recursive function to create folders and upload PBIX files
function Create-FolderStructure {
    param (
        [string]$basePath,
        [string]$parentFolder,
        [PSCredential]$cred,
        [string]$reportServiceUrl,
        [string]$reportUrl
    )

    $List = Get-ChildItem -Path $basePath
    $pbixFiles = Get-ChildItem -Path $basePath -Filter *.pbix
    if ($pbixFiles.Length -gt 0) {
        Upload-PBIXFiles -folderPath $parentFolder -reportServer $reportServiceUrl -pbixFilesPath $basePath -pbiReportUrl $reportUrl -cred $cred
    }

    foreach ($item in $List) {
        if (-not ($item.PSIsContainer -eq $false)) {
            $newBasePath = Join-Path -Path $basePath -ChildPath $item.Name
            $newParentFolder = if ($parentFolder -eq "\") { "\$($item.Name)" } else { "$parentFolder\$($item.Name)" }
			##It works....
            Create-FolderStructure -basePath $newBasePath -parentFolder $newParentFolder -cred $cred -reportServiceUrl $reportServiceUrl -reportUrl $reportUrl
        }
    }
}

# Function to extract zip file
function Extract-ZipFile {
    param (
        [string]$zipFilePath
    )

    # Ensure the provided file exists
    if (-not (Test-Path -Path $zipFilePath)) {
        Write-Host "The file '$zipFilePath' does not exist."
        return $null
    }

    # Determine the destination directory based on the ZIP file name
    $destinationDir = $zipFilePath.Substring(0, $zipFilePath.LastIndexOf("."))

    # Remove the destination directory if it already exists
    if (Test-Path -Path $destinationDir) {
        Remove-Item -Path $destinationDir -Recurse -Force
    }

    # Extract the ZIP file to the destination directory
    Expand-Archive -Path $zipFilePath -DestinationPath $destinationDir -Force

    # Get the last folder name from the destination directory path
    $lastFolderName = Split-Path -Path $destinationDir -Leaf

    # Combine the destination directory and the last folder name
    $finalDestinationPath = Join-Path -Path $destinationDir -ChildPath $lastFolderName

    Write-Host "Directory of the PBIX files ::: $finalDestinationPath"

    # Return the final destination path
    return $finalDestinationPath
}


# Main script execution
$cred = Get-CredentialObject -username $username -password $password
$folderPath = Extract-ZipFile -zipFilePath $zipFilePath
Write-Host "Destination PAth --> $folderPath "
Create-FolderStructure -basePath $folderPath -parentFolder $parentFolder -cred $cred -reportServiceUrl $serviceUrl -reportUrl $reportUrl

Write-Host "PBIX files uploaded successfully!"
Remove-Item -Path $folderPath -Recurse -Force
