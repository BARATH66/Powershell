use trinityDatawarehouse

IF NOT EXISTS (SELECT schema_name FROM information_schema.schemata WHERE schema_name = 'water')
	BEGIN
		EXEC('CREATE SCHEMA water')
	END
GO

IF NOT EXISTS (SELECT schema_name FROM information_schema.schemata WHERE schema_name = 'energy')
	BEGIN
		EXEC('CREATE SCHEMA energy')
	END
GO

IF NOT EXISTS (SELECT schema_name FROM information_schema.schemata WHERE schema_name = 'ml')
	BEGIN
		EXEC('CREATE SCHEMA ml')
	END
GO
	
IF NOT EXISTS (SELECT schema_name FROM information_schema.schemata WHERE schema_name = 'emergency')
	BEGIN
		EXEC('CREATE SCHEMA emergency')
	END
GO

IF NOT EXISTS (SELECT schema_name FROM information_schema.schemata WHERE schema_name = 'safety')
	BEGIN
		EXEC('CREATE SCHEMA safety')
	END
GO
	
IF NOT EXISTS (SELECT schema_name FROM information_schema.schemata WHERE schema_name = 'security')
	BEGIN
		EXEC('CREATE SCHEMA security')
	END
GO

IF NOT EXISTS (SELECT schema_name FROM information_schema.schemata WHERE schema_name = 'weather')
	BEGIN
		EXEC('CREATE SCHEMA weather')
	END

GO

IF NOT EXISTS (SELECT schema_name FROM information_schema.schemata WHERE schema_name = 'waste')
	BEGIN
		EXEC('CREATE SCHEMA waste')
	END

GO

IF NOT EXISTS (SELECT schema_name FROM information_schema.schemata WHERE schema_name = 'ssis')
	BEGIN
		EXEC('CREATE SCHEMA ssis')
	END

GO

IF NOT EXISTS (SELECT schema_name FROM information_schema.schemata WHERE schema_name = 'asset')
	BEGIN
		EXEC('CREATE SCHEMA asset')
	END

GO

IF NOT EXISTS (SELECT schema_name FROM information_schema.schemata WHERE schema_name = 'alarm')
	BEGIN
		EXEC('CREATE SCHEMA alarm')
	END

GO

IF NOT EXISTS (SELECT schema_name FROM information_schema.schemata WHERE schema_name = 'iot')
	BEGIN
		EXEC('CREATE SCHEMA iot')
	END

GO

IF NOT EXISTS (SELECT schema_name FROM information_schema.schemata WHERE schema_name = 'mobility')
	BEGIN
		EXEC('CREATE SCHEMA mobility')
	END

GO

IF NOT EXISTS (SELECT schema_name FROM information_schema.schemata WHERE schema_name = 'bin')
	BEGIN
		EXEC('CREATE SCHEMA bin')
	END

GO

IF NOT EXISTS (SELECT schema_name FROM information_schema.schemata WHERE schema_name = 'iccc')
	BEGIN
		EXEC('CREATE SCHEMA iccc')
	END

GO

IF NOT EXISTS (SELECT schema_name FROM information_schema.schemata WHERE schema_name = 'building')
	BEGIN
		EXEC('CREATE SCHEMA building')
	END

GO

IF NOT EXISTS (SELECT schema_name FROM information_schema.schemata WHERE schema_name = 'Cep')
	BEGIN
		EXEC('CREATE SCHEMA cep')
	END

GO

IF NOT EXISTS (SELECT schema_name FROM information_schema.schemata WHERE schema_name = 'revenue')
	BEGIN
		EXEC('CREATE SCHEMA revenue')
	END

GO

IF NOT EXISTS (SELECT schema_name FROM information_schema.schemata WHERE schema_name = 'employee')
	BEGIN
		EXEC('CREATE SCHEMA employee')
	END

GO

IF NOT EXISTS (SELECT schema_name FROM information_schema.schemata WHERE schema_name = 'swm')
	BEGIN
		EXEC('CREATE SCHEMA swm')
	END

GO

IF NOT EXISTS (SELECT schema_name FROM information_schema.schemata WHERE schema_name = 'ewds')
	BEGIN
		EXEC('CREATE SCHEMA ewds')
	END

GO



--------------------------------------jobFailureNotification--------------------------------------------------------
IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'ssis' AND TABLE_NAME = 'jobFailureNotification')
	BEGIN
	CREATE TABLE [ssis].[jobFailureNotification](
		[Id] [nvarchar](550) PRIMARY KEY NOT NULL,
		[jobId] NVARCHAR (200) NULL,
		[jobName] [varchar](550) NULL,
		[stepId] int NULL,
		[stepName] [varchar](250) NULL,
		[jobActivityMessage] [nvarchar](max) NULL,
		[executionId] int NULL,
		[folderName] [varchar](250) NULL,
		[projectName] [varchar](250) NULL,
		[packageName] [varchar](250) NULL,
		[executedBy] [varchar](250) NULL,
		[statusId] [int] NULL,
		[statusName] [varchar](250) NULL,
		[startTime] DATETIME NULL,
		[endTime] DATETIME NULL,
		[packagePath] [nvarchar](550) NULL,
		[eventName] [varchar](550) NULL,
		[eventMessage] [nvarchar](max) NULL,
	)
	END
GO

--------------------------------------meterConsumption--------------------------------------------------------
IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'iot' AND TABLE_NAME = 'meterConsumption')
	BEGIN
	CREATE TABLE [iot].[meterConsumption](
		[id] [nvarchar](250) NOT NULL PRIMARY KEY,
		[meterId] [varchar](200) NOT NULL,
		[date] [date] NOT NULL,
		[hour] INT NULL,
		[meterType] [varchar](50) NULL,
		[actualConsumption] [float]  NULL,
		[actualGreywater] [float] NULL,
		[actualrevenue] [float]  NULL,
		[wqi] [float] NULL,
		[wqi_pH] [float] NULL,
		[wqi_dissolvedOxygen] [float] NULL,
		[wqi_turbidity] [float] NULL,
		[wqi_temperature] [float] NULL,
		[wqi_bod] [float] NULL,
		[wqi_tds] [float] NULL,
		[wqi_cod] [float] NULL,
		[tenantCode] [varchar](50) NULL,
		[latitude] [float] NULL,
		[longitude] [float] NULL,
		[areaName] varchar(150) NULL,
		[statusName] varchar(50) NULL,
		[greyWaterType] varchar(50) NULL,
		[predictedConsumption] float NULL,
		[predictedGreywater] float NULL,
		[predictedRevenue] float NULL,
		[location] [varchar](250) NULL,
		[carbonFootprints] [float] NULL,
		[predictedEmmision] [float] NULL,
		[lumid] [varchar](100) NULL,
		[lampId] [varchar](100) NULL,
		[lcState] [varchar](15) NULL,
		[alertType] [varchar](150) NULL,
		[deviceName] [varchar](250) NULL,
		[schedulestatus] [varchar](50) NULL
	)
	END
GO


--------------------------------------irrigationDetails--------------------------------------------------------
IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'water' AND TABLE_NAME = 'irrigationDetails')
	BEGIN
	CREATE TABLE [water].[irrigationDetails](
		[Id] [varchar](250) PRIMARY KEY NOT NULL,
		[date] [date] NULL,
		[MAC] [varchar](250) NULL,
		[Hour] [int] NULL,
		[alertName] [varchar](100) NULL,
		[alertType] [varchar](150) NULL,
		[deviceName] [varchar](250) NULL,
		[latitude] [float] NULL,
		[longitude] [float] NULL,
		[schedulestatus] [varchar](50) NULL,
		[status] [varchar](50) NULL,
		[tenantCode] [varchar](50) NULL,
		[consumption] [float] NULL,
		[areaName] VARCHAR(250) NULL
	)
	END
GO

--------------------------------------waterConsumptionDetails--------------------------------------------------------
IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'water' AND TABLE_NAME = 'consumptionDetails')
	BEGIN
	CREATE TABLE [water].[consumptionDetails](
		[id] [nvarchar](200) NOT NULL PRIMARY KEY,
		[meterId] [varchar](200) NOT NULL,
		[date] [date] NOT NULL,
		[hour] INT NULL,
		[meterType] [varchar](50) NULL,
		[actualConsumption] [float]  NULL,
		[actualGreywater] [float] NULL,
		[revenue] [float]  NULL,
		[wqi] [float] NULL,
		[wqi_pH] [float] NULL,
		[wqi_dissolvedOxygen] [float] NULL,
		[wqi_turbidity] [float] NULL,
		[wqi_temperature] [float] NULL,
		[wqi_bod] [float] NULL,
		[wqi_tds] [float] NULL,
		[wqi_cod] [float] NULL,
		[tenantCode] [varchar](50) NULL,
		[latitude] [float] NULL,
		[longitude] [float] NULL,
		[areaName] varchar(150) NULL,
		[statusName] varchar(20) NULL,
		[greyWaterType] varchar(50) NULL,
		[predictedConsumption] float NULL,
		[predictedGreywater] float NULL,
		[predictedRevenue] float NULL
	)
	END
GO

CREATE OR ALTER VIEW [water].[v_area_wise_info] AS
	SELECT 
		 [date] ,SUM([actualConsumption]) as consumption, AVG([wqi]) as wqi,
		AVG([wqi_pH]) as wqi_pH, [tenantCode], concat(round([latitude],2), round( [longitude],2)) as lat_long,
		concat('Area',COUNT(*)) as Area 
		FROM [water].[consumptionDetails]
		GROUP BY  [date], [tenantCode], concat(round([latitude],2), round( [longitude],2)) 

GO

--*****************************************************lighting Tables*************************************
IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'energy' AND TABLE_NAME = 'lightingConsumption')
	BEGIN
	CREATE TABLE [energy].[lightingConsumption](
		[Id] [varchar](250) PRIMARY KEY NOT NULL,
		[date] [date] NULL,
		[Energy] [float] NULL,
		[LUMID] [varchar](100) NULL,
		[LampId] [varchar](100) NULL,
		[Lcstate] [varchar](15) NULL,
		[MAC] [varchar](205) NULL,
		[hour] [int] NULL,
		[tenantCode] [varchar](50) NULL,
		[areaName] [varchar](250) NULL,
		[revenue] [float] NULL,
		[latitude] [float] NULL,
		[longitude] [float] NULL
	) 
	END
GO

--*****************************************************Energy Tables*************************************

IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'energy' AND TABLE_NAME = 'consumptionDetails')
	BEGIN
	CREATE TABLE [energy].[consumptionDetails](
		[Id] [nvarchar](250) PRIMARY KEY,
		[date] [date] NULL,
		[hour] INT NULL,
		[mac] [varchar](255) NULL,
		[deviceName] [varchar](250) NULL,
		[latitude] [float] NULL,
		[longitude] [float] NULL,
		[location] [varchar](250) NULL,
		[tenantCode] [varchar](50) NULL,
		[energyConsumption] [float] NULL,
		[revenue] [float] NULL,
		[carbonFootprints] [float] NULL,
		[areaName] varchar(150) Null,
		[statusName] varchar(20) NULL,
		[predictedConsumption] [float] NULL,
		[predictedEmmision] [float] NULL,
		[predictedRevenue] [float] NULL
	) 
	END
GO

--...................................User Details Table............................................................

IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'energy' AND TABLE_NAME = 'userDetails')
	BEGIN
	CREATE TABLE [energy].[userDetails](
		[userid] [varchar](100) PRIMARY KEY,
		[username] [varchar](200) NULL,
		[meterid] [varchar](200) NULL,
		[date] [date] NULL,
		[totalbill] [float] NULL,
		[pendingBill] [float] NULL,
		[dueDate] [date] NULL,
		[costCategory] [int] NULL
	)
	END
GO

IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'water' AND TABLE_NAME = 'userDetails')
	BEGIN
	CREATE TABLE [water].[userDetails](
		[userid] [varchar](100) NULL,
		[username] [varchar](200) NULL,
		[meterid] [varchar](200) NULL,
		[date] [date] NULL,
		[totalbill] [float] NULL,
		[pendingBill] [float] NULL,
		[dueDate] [date] NULL,
		[costCategory] [int] NULL
	) 
	END
GO

--...........................................Cost Details Tables .....................................................

IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'energy' AND TABLE_NAME = 'costDetails')
	BEGIN
	CREATE TABLE [energy].[costDetails](
		[tenantCode] [varchar](50) NULL,
		[deviceType] [varchar](50) NULL,
		[country] [varchar](50) NULL,
		[consumptionUnit] [varchar](50) NULL,
		[cost] [float] NULL,
		[currency] [varchar](50) NULL
	)
	END
GO

IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'water' AND TABLE_NAME = 'costDetails')
	BEGIN
	CREATE TABLE [water].[costDetails](
		[tenantCode] [varchar](50) NULL,
		[deviceType] [varchar](50) NULL,
		[country] [varchar](50) NULL,
		[consumptionUnit] [varchar](50) NULL,
		[cost] [float] NULL,
		[currency] [varchar](50) NULL
	)
	END
GO


--*****************************************************Fire Emergency Tables******************************************

IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'safety' AND TABLE_NAME = 'fireEquipmentDetails')
	BEGIN
	CREATE TABLE [safety].[fireEquipmentDetails](
	[Id] [varchar](50) NOT NULL primary key,
	[equipmentId] [varchar](100) NOT NULL,
	[equipmentName] [varchar](250) NULL,
	[equipmentType] [varchar](100) NULL,
	[fireEngineId] [int] NULL,
	[manufacturedDate] [datetime] NULL,
	[status] [varchar](50) NULL,
	[expiryDate] [datetime] NULL,
	[quantity] [int] NULL,
	[nodeId] [varchar](50) NULL,
	[tenantCode] [varchar](50) NULL,
	[additionalDetails] [varchar](500) NULL,
	[availability] [varchar](50) NULL,
	[fireEquipmentId] [varchar](50) NULL,
	[fk_fireEngineId] [nvarchar](150) NULL,
	[lastMaintenance] [varchar](150) NULL,
	[equipmentNumber] [varchar](250) NULL,
	)
	END
GO

IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'safety' AND TABLE_NAME = 'workforceDetails')
	BEGIN
	CREATE TABLE [safety].[workforceDetails](
	[engineName] [nvarchar](255) NULL,
	[equipmentList] [nvarchar](max) NULL,
	[engineId] [int] NULL,
	[features] [nvarchar](max) NULL,
	[serviceProvided] [nvarchar](255) NULL,
	[resourcePhoto] [nvarchar](max) NULL,
	[resourceRoleId] [nvarchar](50) NULL,
	[workforceLoginName] [nvarchar](255) NULL,
	[workforceUserName] [nvarchar](255) NULL,
	[tenantCode] [varchar](350) NULL,
	[captainName] [varchar](255) NULL,
	[incidentName] [varchar](355) NULL,
	[esopId] [int] NULL,
	[responseEndTime] [datetime] NULL,
	[responseStartTime] [datetime] NULL,
	[workforceUserId] [int] NULL,
	[incidentId] [varchar](255) PRIMARY KEY NOT NULL
	)
	END
	GO

IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'safety' AND TABLE_NAME = 'fireEngineDetails')
	BEGIN
	CREATE TABLE [safety].[fireEngineDetails](
	[Id] [varchar](50) PRIMARY KEY NOT NULL,
	[availability] [varchar](50) NULL,
	[callSign] [varchar](50) NULL,
	[engineNumber] [varchar](50) NULL,
	[features] [varchar](400) NULL,
	[fireEngineId] [int] NOT NULL,
	[fireEngineName] [varchar](255) NULL,
	[fireStationId] [int] NULL,
	[fleetTypeCode] [varchar](50) NULL,
	[fuelType] [varchar](50) NULL,
	[Longitude] [float] NULL,
	[Latitude] [float] NULL,
	[manufactureDate] [datetime] NULL,
	[macId] [varchar](250) NULL,
	[numberPlateIdentifier] [varchar](50) NULL,
	[pumpStatus] [varchar](50) NULL,
	[serviceProvided] [varchar](255) NULL,
	[status] [varchar](50) NULL,
	[transmission] [varchar](50) NULL,
	[vehicleType] [int] NULL,
	[waterTankCapacity] [int] NULL,
	[tenantCode] [varchar](50) NULL,
	[equipmentList] [varchar](500) NULL,
	[fuelLevel] [varchar](50) NULL,
	[waterLevel] [varchar](50) NULL,
	[foamSystemType] [varchar](50) NULL,
	[fuelCapacityInLiters] [varchar](50) NULL,
	[manufacturer] [varchar](250) NULL,
	[foamLevel] [varchar](50) NULL,
	[fk_fireStationId] [nvarchar](150) NULL,
	)
	END
GO

IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'safety' AND TABLE_NAME = 'fireStationDetails')
	BEGIN
	CREATE TABLE [safety].[fireStationDetails](
	[Id] [varchar](50) NOT NULL primary key,
	[fireStationId] [int] NOT NULL,
	[fireStationName] [varchar](250) NULL,
	[address] [nvarchar](max) NULL,
	[noOfFloors] [int] NULL,
	[buildingType] [varchar](50) NULL,
	[modelurl] [nvarchar](max) NULL,
	[peopleCapacity] [int] NULL,
	[peopleOccupancy] [int] NULL,
	[buildingImage] [nvarchar](max) NULL,
	[agencyId] [int] NULL,
	[Latitude] [float] NULL,
	[Longitude] [float] NULL,
	[tenantCode] [varchar](50) NULL,
	)
	END
GO

IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'safety' AND TABLE_NAME = 'fireStationWorkforceDetails')
	BEGIN
	CREATE TABLE [safety].[fireStationWorkforceDetails](
	[Id] [varchar](100) PRIMARY KEY NOT NULL,
	[resourceId] [varchar](150) NULL,
	[resourceName] [varchar](150) NULL,
	[stationName] [varchar](150) NULL,
	[stationId] [varchar](150) NULL,
	[allocationStatus] [varchar](150) NULL,
	[availability] [varchar](50) NULL,
	[allocationTime] [datetime] NULL,
	[certified] [varchar](150) NULL,
	[departmentCode] [varchar](150) NULL,
	[departmentName] [varchar](150) NULL,
	[experienceLevel] [varchar](150) NULL,
	[role] [varchar](150) NULL,
	[shiftType] [varchar](150) NULL,
	[skillset] [varchar](350) NULL,
	[traningRecords] [varchar](500) NULL,
	[events] [varchar](250) NULL,
	[workforceId] [varchar](150) NULL,
	[lastPunchedIn] [datetime] NULL,
	[lastPunchedOut] [datetime] NULL,
	[uuid] [varchar](50) NULL,
	[deviceProfile] [varchar](50) NULL,
	[address] [varchar](500) NULL,
	[resourcePhoto] [varchar](500) NULL,
	[ceritified] [varchar](20) NULL,
	[allocatedTo] [varchar](100) NULL,
	[workforceUserName] [varchar](100) NULL,
	[workforceLoginName] [varchar](20) NULL,
	[phoneNumber] [varchar](100) NULL,
	[emailID] [varchar](250) NULL,
	[loginStatus] [varchar](50) NULL,
	[FCMID] [varchar](50) NULL,
	[userType] [varchar](250) NULL,
	[resourceSkillID] [varchar](50) NULL,
	[resourceRoleID] [varchar](50) NULL,
	[resourceProfilePic] [varchar](500) NULL,
	[lastActiveTime] [varchar](100) NULL,
	[entityFireEngineId] [varchar](50) NULL,
	[nodeId] [varchar](50) NULL,
	[resourceProfilePicFileuuid] [varchar](500) NULL,
	[resourcePhotoFileuuid] [varchar](500) NULL,
	[tenantCode] [nvarchar](50) NULL,
	[latitude] [float] NULL,
	[longitude] [float] NULL,
	[fk_fireEngineId] [nvarchar](150) NULL,
	)
	END
GO
----------------------------------------------Soucetype-----------------------------------------


IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'safety' AND TABLE_NAME = 'sourceType')
	BEGIN
	CREATE TABLE [safety].[sourceType](
	[eventId] [nvarchar](255) PRIMARY KEY  NOT NULL,
	[sourceType] [nvarchar](100) NULL
	)
	END

GO



----*************************Temporary Tables******************************************

IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'ssis' AND TABLE_NAME = 'queryInfo')
	BEGIN
	CREATE TABLE [ssis].[queryInfo](
		[tableName] [varchar](255) NOT NULL PRIMARY KEY,
		[query] [nvarchar](max) NOT NULL,
		[tenantCode] NVARCHAR(50) NULL
	)
	END

GO

IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'ssis' AND TABLE_NAME = 'buildingQueryInfo')
	BEGIN
	CREATE TABLE [ssis].[buildingQueryInfo](
		[tableName] [varchar](255) NOT NULL PRIMARY KEY,
		[query] [nvarchar](max) NOT NULL,
		[tenantCode] NVARCHAR(50) NULL
	)
	END

GO

----*************************assetDetails Table******************************************
IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'iot' AND TABLE_NAME = 'assetDetails')
	BEGIN
	CREATE TABLE [iot].[assetDetails](
	Id nvarchar (250) PRIMARY KEY NOT NULL,
	[deviceId] [varchar](250) NULL,
	[uuid] [varchar](250) NOT NULL,
	[macId] [varchar](250) NOT NULL,
	[address] [nvarchar](2000) NULL,
	[categoryId] [int] NULL,
	[categoryName] [varchar](250) NULL,
	[companyCode] [varchar](50) NOT NULL,
	[deviceCreatedDate] [datetime] NULL,
	[deviceName] [varchar](250) NULL,
	[deviceTypeId] [int] NULL,
	[deviceTypeName] [varchar](250) NULL,
	[assetIcon] [varchar](2000) NULL,
	[gatewayId] [int] NULL,
	[gatewayName] [varchar](250) NULL,
	[healthStatusId] [int] NULL,
	[healthStatusName] [varchar](100) NULL,
	[isActive] [bit] NULL,
	[latitude] [float] NULL,
	[longitude] [float] NULL,
	[layoutId] [varchar](250) NULL,
	[layoutInFold] [int] NULL,
	[layoutName] [varchar](250) NULL,
	[layoutTypeId] [varchar](250) NULL,
	[locationTypeId] [int] NULL,
	[deviceManufacturedDate] [date] NULL,
	[statusName] [varchar](100) NULL,
	[statusId] [int] NULL,
	[deviceUpdatedDate] [datetime] NULL,
	[Warranty] [varchar](100) NULL,
	[assetTypeId] [int] NULL,
	[assetTypeName] [varchar](20) NULL,
	[deviceCreatedBy] [varchar](250) NULL,
	[profileName] [varchar](500) NULL,
	[vendorName] [nvarchar](500) NULL,
	[protocolName] [nvarchar](250) NULL,
	[authName] [varchar](250) NULL,
	[installationDate] [nvarchar](150) NULL,
	[LicenceExpiredDate] [datetime] NULL,
	[licenceKey] [nvarchar](500) NULL
	)
	END

GO

IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'iot' AND TABLE_NAME = 'assetTypeDetails')
	BEGIN
	CREATE TABLE [iot].[assetTypeDetails](
	deviceTypeId INT PRIMARY KEY NOT NULL,
	deviceTypeCode VARCHAR(25) NULL,
	deviceTypeName VARCHAR(150) NULL
	)
	END

GO

----------------------------------------------Category-----------------------------------------


IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'iot' AND TABLE_NAME = 'category')
	BEGIN
	CREATE TABLE [iot].[category](
	[CategoryId] [int] PRIMARY KEY NOT NULL,
	[CategoryName] [nvarchar](100) NULL,
	[CategoryImageUrl] [varchar](2000) NULL,
	[IsRequired] [bit] NULL,
	[CompanyId] [int] NULL,
	[RefreshIntervel] [int] NULL,
	[IsRefreshRequired] [bit] NULL,
	[ClusterColour] [nvarchar](50) NULL,
	[IsDisaster] [bit] NULL,
	[CategoryCode] [varchar](500) NULL,
	[TenantCode] [varchar](100) NULL,
	[IsAssigned] [int] NULL,
	[ApplicationTypeId] [varchar](50) NULL,
	[IsActive] [bit] NULL,
	)
	END

GO

----*************************alarmDetails Table******************************************
IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'iot' AND TABLE_NAME = 'alarmDetails')
	BEGIN
	CREATE TABLE [iot].[alarmDetails](
	[macId] [nvarchar](250) NULL,
	[alarmId] [int] NOT NULL primary key,
	[alarmName] [nvarchar](250) NULL,
	[alarmStatusId] [int] NULL,
	[alarmStatusName] [nvarchar](100) NULL,
	[alarmGeneratedTime] [datetime] NULL,
	[categoryId] [int] NULL,
	[categoryName] [nvarchar](250) NULL,
	[categoryIcon] [nvarchar](max) NULL,
	[companyCode] [nvarchar](50) NULL,
	[deviceType] [int] NULL,
	[eventCreatedTime] [datetime] NULL,
	[eventId] [nvarchar](250) NULL,
	[imageUrl] [nvarchar](max) NULL,
	[location] [nvarchar](max) NULL,
	[latitude] [float] NULL,
	[longitude] [float] NULL,
	[orchestrationSOPId] [int] NULL,
	[priorityName] [varchar](100) NULL,
	[priorityId] [int] NULL,
	[sopActualTimeToClose] [datetime] NULL,
	[sopCloseTime] [datetime] NULL,
	[sopId] [int] NULL,
	[sopName] [nvarchar](250) NULL,
	[transactionSOPId] [int] NULL,
	[sourceType] [nvarchar](50) NULL,
	[areaName] [varchar](250) NULL,
	[sourceTypeId] [int] NULL,
	[userName] [nvarchar](250) NULL,
	[alarmAbandonTime] [datetime] NULL,
	[image] [nvarchar](2000) NULL,
	[video] [nvarchar](2000) NULL,
	[audio] [nvarchar](2000) NULL,
	[deviceTypeName] [nvarchar](250) NULL,
	[alarmTypeId] [int] NULL,
	[layoutId] [int] NULL,
	[layoutSubId] [int] NULL,
	[layoutType] [int] NULL,
	[fk_buildingId] [nvarchar](150) NULL,
	[deviceName] [nvarchar](150) NULL,
	[eventStatusId] [int] NULL,
	[eventDescription] [nvarchar](1000) NULL,
	[jurisdiction] [nvarchar](500) NULL,
	[locationType] [int] NULL,
	[executionTime] [datetime] NULL,
	[eventExecutionStage] [nvarchar](500) NULL,
	)
	END

GO

----*************************alarmAuditDetails Table******************************************
IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'iot' AND TABLE_NAME = 'alarmAuditDetails')
	BEGIN
	CREATE TABLE [iot].[alarmAuditDetails](
	id NVARCHAR(500) PRIMARY KEY NOT NULL,
    macId VARCHAR(250) NULL,
    alarmId INT NULL,
	[componentId] [int] NULL,
	[comments] [varchar](250) NULL,
	[commentDate] datetime NULL,
	[commentUser] nvarchar(50) NULL,
	[auditOperator] nvarchar(20) NULL,
	[auditModifiedTime] datetime NULL,
	[auditModifiedParameter] nvarchar(100) NULL,
	[auditPreviousName] nvarchar(200) NULL,
	[auditLatestValue] nvarchar(200) NULL,
	[handOverPreviousComponentId] int NULL,
	[handOverComponentId] int NULL,
	[handOverPreviousUser] nvarchar(200) NULL,
	[handOverUser] nvarchar(200) NULL,
	[handoverTime] datetime NULL,
	[handoverReason] nvarchar(max) NULL
	
	)
	END

GO


----*************************tenant Table******************************************
IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'iot' AND TABLE_NAME = 'tenant')
	BEGIN
	CREATE TABLE [iot].[tenant](
	[Id] VARCHAR(50) PRIMARY KEY,
    [tenantId] INT NOT NULL,
    [tenantName] VARCHAR(40) NULL,
    [tenantStatus] BIT NULL,
    [updatedDate] DATETIME NULL,
    [tenantLat] DECIMAL(10,7) NULL,
    [tenantLon] DECIMAL(10,7) NULL,
    [tenantCode] VARCHAR(40) NOT NULL,
    [isActive] BIT NULL,
    tenantContact1 VARCHAR(50),
    ContactPerson VARCHAR(100),
    tenantEmailId NVARCHAR(255),
    CreatedDate DATETIME,
    ExpiryDate DATETIME,
    DeviceTypeId NVARCHAR(555),
    tenantStatusDescription VARCHAR(255),
    ThemeId INT,
    tenantAddress NVARCHAR(555),
    Extent1 FLOAT,
    Extent2 FLOAT,
    Extent3 FLOAT,
    Extent4 FLOAT,
    GoogleMaxZoom INT,
    TrinityMaxZoom INT,
    GoogleZoom INT,
    GoogleMinZoom INT,
    MapType VARCHAR(50),
    MapData VARCHAR(MAX),
    TrinityMinZoom INT,
    GoogleMapKey NVARCHAR(555),
    MapLib NVARCHAR(50),
    MapDimension NVARCHAR(50),
    SetResolution INT,
    AgencyTypeIds NVARCHAR(555),
    MapMode VARCHAR(50),
    ReportLogo NVARCHAR(1000)

	)
	END

GO

----*************************sopMain Table******************************************
IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'iot' AND TABLE_NAME = 'sopMain')
	BEGIN
	CREATE TABLE [iot].[sopMain](
	Id varchar(100) NOT NULL PRIMARY KEY,
    eventId varchar(50) NOT NULL,
    esopId int NOT Null,
    sopName varchar(255) NOT NULL,
    eventCreatedTime datetime NULL,  
    sopActualTimeToClose datetime Null,
    sopClosedTime datetime,
    tenantCode varchar(50)  NULL
	)
	END

GO

----*************************sopActivityStep Table******************************************
IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'iot' AND TABLE_NAME = 'sopActivityStep')
	BEGIN
	CREATE TABLE [iot].[sopActivityStep](
	[Id] VARCHAR(200) NOT NULL PRIMARY KEY,
	[sopActivityName] VARCHAR(250) NULL,
	[esopId] INT NULL,
	status VARCHAR(100) NULL,
	[stepType] INT NULL,
	[stepSequenceId] VARCHAR(50)NULL,
	[stepDescription] VARCHAR(550) NULL,
	[stepComment] VARCHAR(550) NULL,
	[isAuto] INT NULL,
	[stepStatus] INT NULL
	)
	END

GO

----*************************workforceIncident******************************************
IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'iot' AND TABLE_NAME = 'workforceIncident')
	BEGIN
	CREATE TABLE [iot].[workforceIncident](
	Id VARCHAR(255) NOT NULL PRIMARY KEY,
    esopId INT NULL,
    incidentId VARCHAR(255) NULL,
    incidentName VARCHAR(255) NULL,
    sourceName VARCHAR(155) NULL,
    incidentStatusId INT NULL,
	incidentStatusName Varchar(50) NULL,
	incidentCreatedDate DATETIME NULL,
	incidentCreatedBy VARCHAR(255) NULL,
	incidentUpdatedDate DATETIME NULL,
	incidentUpdatedBy VARCHAR(255) NULL,
	latitude FLOAT NULL,
	longitude FLOAT NULL,
	incidentPriority VARCHAR(55) NULL,
	departmentId INT NULL,
	workforceId VARCHAR(55) NULL,
    tenantCode VARCHAR(50) NULL,
	statusUpdatedDate DATETIME NULL,
	statusUpdatedBy VARCHAR(50) NULL,
	statusComment VARCHAR(1000) NULL,
	fileTypeId INT NULL,
	fileTypeName VARCHAR(30) NULL,
	fileUrl VARCHAR(1000) NULL,
	[atrFileUrl] [nvarchar](500) NULL,
	[atrUpdatedTime] [datetime] NULL,
	[atrFileType] [int] NULL
	)
	END

GO

----*************************workforceUser******************************************
IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'iot' AND TABLE_NAME = 'workforceUser')
	BEGIN
	CREATE TABLE [iot].[workforceUser](
	Id VARCHAR(255) NOT NULL PRIMARY KEY,
    departmentId INT,
    departmentCode VARCHAR(255),
    userType INT,
    emailId VARCHAR(355),
    logInStatus INT,
    mobileNo VARCHAR(500),
    workforceName VARCHAR(255),
    workforceFirstName VARCHAR(100),
    workforceLastName VARCHAR(100),
    profilePhoto NVARCHAR(555),
    tenantCode VARCHAR(50),
    roleId INT,
	roleName VARCHAR(50),
    workforceId VARCHAR(55),
	startDate datetime,
	endDate datetime,
	questionId int,
	address nvarchar (150)
	)
	END

GO



----*************************workforceDepartmentDetails******************************************
IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'iot' AND TABLE_NAME = 'workforceDepartmentDetails')
	BEGIN
	CREATE TABLE [iot].[workforceDepartmentDetails](
	[id] [nvarchar](100) NOT NULL primary key,
	[tenantId] [int] NULL,
	[tenantCode] [varchar](255) NULL,
	[department] [varchar](255) NULL,
	[departmentCode] [varchar](255) NULL,
	[createdDate] [datetime2](6) NULL,
	[createdBy] [varchar](255) NULL,
	[departmentId] [int] NULL,
	)
	END

GO


----*************************notificationDetails Table******************************************
IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'iot' AND TABLE_NAME = 'notificationDetails')
	BEGIN
	CREATE TABLE [iot].[notificationDetails](
	Id VARCHAR(500) NOT NULL PRIMARY KEY,
    stepSequenceId VARCHAR(255) NULL,
    appCode VARCHAR(255) NULL,
    appUserName VARCHAR(255) NULL,
    isProcessed INT NULL,
    sendDateTime DATETIME NULL,
    channelCode VARCHAR(55) NULL,
    message NVARCHAR(600) NULL,
    isDelivered INT NULL,
    isFailed INT NULL,
    isInProgress INT NULL,
    isNotConfirmed INT NULL,
    isCancelled INT NULL,
    channelName VARCHAR(255) NULL,
    userFirstName VARCHAR(255) NULL,
    userLastName VARCHAR(255) NULL,
    userStatus INT NULL,
    userId INT NULL,
    userContactInfo NVARCHAR(555) NULL,
    userContactTypeId INT NULL,
    groupId VARCHAR(255) NULL,
    groupName VARCHAR(255) NULL,
    groupContactName VARCHAR(255) NULL,
    groupEmailId VARCHAR(255) NULL,
    groupMobileNo VARCHAR(20)NULL,
	latitude float NULL,
	longitude float NULL
	)
	END
GO

----*************************notifyAlerts Table******************************************
IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'iot' AND TABLE_NAME = 'notifyAlerts')
BEGIN
CREATE TABLE [iot].[notifyAlerts](
	[processedon] [date] NULL,
	[pk_alert_id] [int] NULL,
	[campaignName] [varchar](255) NULL,
	[alertName] [varchar](255) NULL,
	[priority] [varchar](255) NULL,
	[severity] [varchar](255) NULL,
	[initialStatus] [varchar](255) NULL,
	[alertCreated] [date] NULL,
	[applicationCode] [varchar](100) NULL,
	[appUserName] [nvarchar](255) NULL,
	[tenantCode] [nvarchar](255) NULL,
	[address] [nvarchar](max) NULL,
	[channelCreatedDate] [date] NULL,
	[channelCode] [varchar](255) NULL,
	[channelStatus] [bit] NULL,
	[fk_alert_id] [int] NULL,
	[alertExpiryTime] [datetime] NULL,
	[statusId] [bit] NULL,
	[Status] [varchar](7) NULL,
	[groupNames] [nvarchar](max) NULL,
	[userIds] [nvarchar](max) NULL,
	[totalUsers] [int] NULL,
	[Id] [nvarchar](250) NOT NULL primary key,
	[latitude] [float] NULL,
	[longitude] [float] NULL,
) 
END
GO

----*************************gpsPackageDetails Table******************************************
IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'mobility' AND TABLE_NAME = 'gpsPackageDetails')
	BEGIN
	CREATE TABLE [mobility].[gpsPackageDetails](
	id nvarchar(200) NOT NULL PRIMARY KEY,
	[macId] [nvarchar](50) NULL,
	[date] [date] NULL,
	[packetsReceived] [int] NULL,
	[deviceType] [nvarchar](200) NULL,
	[expectedPacket] INT NULL
	)
	END

GO


----*************************iot.ApplicationDetails******************************************
IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'iot' AND TABLE_NAME = 'ApplicationDetails')
	BEGIN
	CREATE TABLE [iot].[applicationDetails](
	Id VARCHAR(200) PRIMARY KEY,
    [applicationId] INT,
    [applicationName] VARCHAR(255),
    [applicationUrl] NVARCHAR(1000),
    [applicationIcon] NVARCHAR(2000),
    [applicationDescription] VARCHAR(1000),
    [tenantId] INT,
    [userOperatorCount] INT
	)
	END

GO

----*************************iot.ApplicationRoles******************************************
IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'iot' AND TABLE_NAME = 'ApplicationRoles')
	BEGIN
	CREATE TABLE [iot].[applicationRoles](
	Id VARCHAR(200) PRIMARY KEY,
	[appRoleId] INT,
    [applicationId] INT,
    [roleName] VARCHAR(355)
	)
	END

GO

----*************************iot.userMaster******************************************
IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'iot' AND TABLE_NAME = 'userMaster')
	BEGIN
	CREATE TABLE [iot].[userMaster](
	Id VARCHAR(200) PRIMARY KEY,
	[userId] INT,
    [userName] VARCHAR(250),
    [userMobileNo] VARCHAR(100),
    [userEmail] NVARCHAR(300),
    [createdDate] DATETIME,
    [tenantId] INT,
    [loginEmailId] NVARCHAR(300),
    [userAuthId] NVARCHAR(500),
    [password] NVARCHAR(500)
	)
	END

GO

----*************************iot.userRoles******************************************
IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'iot' AND TABLE_NAME = 'userRoles')
	BEGIN
	CREATE TABLE [iot].[userRoles](
	Id VARCHAR(200) PRIMARY KEY,
	[roleId] INT,
    [roleName] VARCHAR(255),
    [tenantCode] VARCHAR(50)
	)
	END

GO

----*************************iot.userAssignedRoles******************************************
IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'iot' AND TABLE_NAME = 'userAssignedRoles')
	BEGIN
	CREATE TABLE [iot].[userAssignedRoles](
	Id VARCHAR(200) PRIMARY KEY,
	[userRoleId] INT,
    [userRoleName] VARCHAR(2555),
    [userName] VARCHAR(255)
	)
	END

GO
----*************************userMaster Table******************************************
IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'iccc' AND TABLE_NAME = 'userMaster')
	BEGIN
	CREATE TABLE [iccc].[userMaster](
	Id VARCHAR(200) PRIMARY KEY,
    userId INT NULL,
    userName VARCHAR(50) NULL,
    userEmailId NVARCHAR(200) NULL,
    userActiveStatus INT NULL,
    userLoginName VARCHAR(50) NULL,
    userLoginStatus INT NULL,
    userTypeName VARCHAR(50) NULL,
    userTypeId INT NULL,
	componentId [int] NULL,
    tenantCode VARCHAR(50) NULL
	)
	END

GO

----*************************locationMaster Table******************************************
IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'iot' AND TABLE_NAME = 'locationMaster')
	BEGIN
	CREATE TABLE [iot].[locationMaster](
	Id VARCHAR(250) PRIMARY KEY,
    [areaName] VARCHAR(250) NULL,
	[tenantCode] VARCHAR(55) NULL,
	[polygon] NVARCHAR(max) NULL
	)
	END

GO

------------------------------------------------assetUpTimeDownTime---------------------------------------------------------
IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'iot' AND TABLE_NAME = 'assetUpTimeDownTime')
	BEGIN
	CREATE TABLE [iot].[assetUpTimeDownTime](
		[Id] VARCHAR(250) PRIMARY KEY NOT NULL,
		[date] [date] NOT NULL,
		[macId] [varchar](200) NOT NULL,
		[onDuration] [int] NULL,
		[onUpdatedTime] [datetime] NULL,
		[offDuration] [int] NULL,
		[offUpdatedTime] [datetime] NULL,
		[previousStatus] [int] NULL,
		[tenantCode] [varchar](50) NULL
	)
	END
GO

IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'water' AND TABLE_NAME = 'assetUpTimeDownTime')
	BEGIN
	CREATE TABLE [water].[assetUpTimeDownTime](
		[Id] VARCHAR(250) PRIMARY KEY NOT NULL,
		[date] [date] NOT NULL,
		[macId] [varchar](200) NOT NULL,
		[onDuration] [int] NULL,
		[onUpdatedTime] [datetime] NULL,
		[offDuration] [int] NULL,
		[offUpdatedTime] [datetime] NULL,
		[previousStatus] [int] NULL,
		[tenantCode] [varchar](50) NULL
	)
	END
GO

IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'energy' AND TABLE_NAME = 'assetUpTimeDownTime')
	BEGIN
	CREATE TABLE [energy].[assetUpTimeDownTime](
		[Id] VARCHAR(250) PRIMARY KEY NOT NULL,
		[date] [date] NOT NULL,
		[macId] [varchar](200) NOT NULL,
		[onDuration] [int] NULL,
		[onUpdatedTime] [datetime] NULL,
		[offDuration] [int] NULL,
		[offUpdatedTime] [datetime] NULL,
		[previousStatus] [int] NULL,
		[tenantCode] [varchar](50) NULL
	)
	END
GO

-------------------------------checkPointInPolygon---------------------------------------------------------------------

CREATE OR ALTER PROCEDURE [iot].[CheckPointInPolygon]
    @PointData VARCHAR(max)
AS
BEGIN
    -- Declare variables
   DECLARE @IsContained INT = 0;
    DECLARE @Point geometry;
    DECLARE @PolygonData VARCHAR(max);
    DECLARE @AreaName VARCHAR(max);
    DECLARE @MatchingAreaName VARCHAR(max) = 'NULL';

    SET @Point = geometry::STGeomFromText(@PointData, 4326);
	SET @Point = @Point.MakeValid();

    DECLARE polygon_cursor CURSOR FOR
        SELECT [polygon], [areaName]
        FROM [iot].[locationMaster];

    OPEN polygon_cursor;

    FETCH NEXT FROM polygon_cursor INTO @PolygonData, @AreaName;

    WHILE @@FETCH_STATUS = 0
    BEGIN
        DECLARE @Polygon geometry;
        SET @Polygon = geometry::STGeomFromText(@PolygonData, 4326);
		SET @Polygon = @Polygon.MakeValid();
		--DECLARE @BufferedPolygon geometry = @Polygon.STBuffer(0.09001);
		--or @Point.STWithin(@BufferedPolygon) =1
        IF @Point.STWithin(@Polygon) = 1 or @Point.STIntersects(@Polygon) =1 or  @Point.STTouches(@Polygon) =1 
        BEGIN
            SET @IsContained = 1;
            SET @MatchingAreaName = @AreaName;
            BREAK;
        END;

        FETCH NEXT FROM polygon_cursor INTO @PolygonData, @AreaName;
    END;

    CLOSE polygon_cursor;
    DEALLOCATE polygon_cursor;

    SELECT @IsContained AS IsContained, @MatchingAreaName AS AreaName;
END;

GO

-------------------------------alertAreaView-----------------------------------------------------------------------

CREATE OR ALTER view [iccc].[alertArea]

AS
	WITH Numbers AS (
		SELECT 0 AS n
		UNION ALL
		SELECT n + 1
		FROM Numbers
		WHERE n < 100
	)

	SELECT latitude, longitude, 'POLYGON((' +
			STUFF((
				SELECT ', ' + CAST(Longitude AS VARCHAR(20)) + ' ' + CAST(Latitude AS VARCHAR(20))
				FROM (
					SELECT 
						Latitude + 5 * COS(2 * PI() * n / 100) AS Latitude,
						Longitude + 5 * SIN(2 * PI() * n / 100) AS Longitude
					FROM 
						Numbers
				) AS Circumference
				FOR XML PATH('')), 1, 2, '') +
			', ' + CAST(Longitude AS VARCHAR(20)) + ' ' + CAST(Latitude AS VARCHAR(20)) + ',' +
			STUFF((
				SELECT ', ' + CAST(Longitude AS VARCHAR(20)) + ' ' + CAST(Latitude AS VARCHAR(20))
				FROM (
					SELECT TOP(1)
						Latitude + 5 * COS(2 * PI() * n / 100) AS Latitude,
						Longitude + 5 * SIN(2 * PI() * n / 100) AS Longitude
					FROM 
						Numbers
				) AS Circumference
				FOR XML PATH('')), 1, 2, '') + '))' as polygon, CONCAT('Area_',
				ROW_NUMBER() OVER(order by latitude)) as area, COUNT(DISTINCT alarmId) as noOfAlarms
	FROM
		   [trinityDatawarehouse].[iot].[alarmDetails]
		   GROUP BY longitude, latitude

GO
-------------------------------createPolygon---------------------------------------------------------------------

CREATE OR ALTER             PROCEDURE [iot].[createPolygon]
	@lat float,
	@lon float,
	@PolygonData VARCHAR(MAX) OUTPUT 
AS
BEGIN
  
DECLARE @pointsNo INT = 6;
DECLARE @radius FLOAT = 10; 

WITH Numbers AS (
    SELECT 0 AS n
    UNION ALL
    SELECT n + 1
    FROM Numbers
    WHERE n < @pointsNo
)
SELECT @PolygonData = 'POLYGON((' +
    STUFF((
        SELECT ', ' + FORMAT(Longitude, '0.##########')  + ' ' + FORMAT(Latitude, '0.##########')
        FROM (
            SELECT 
                @lat + @radius * COS(2 * PI() * n / @pointsNo) AS Latitude,
                @lon + @radius * SIN(2 * PI() * n / @pointsNo) AS Longitude
            FROM 
                Numbers
        ) AS Circumference
        FOR XML PATH('')), 1, 2, '') + '' +
    (
        SELECT TOP(1)
            ', ' + FORMAT(Longitude, '0.##########')  + ' ' + FORMAT(Latitude, '0.##########')
        FROM (
            SELECT 
                @lat + @radius * COS(2 * PI() * n / @pointsNo) AS Latitude,
                @lon + @radius * SIN(2 * PI() * n / @pointsNo) AS Longitude
            FROM 
                Numbers
        ) AS Circumference
    ) + '))';

SELECT @PolygonData;

END
GO


-------------------------------------Smart City Tables----------------------------------------------------------------

-------------------------------congestionDetails------------------------------------------------

IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'mobility' AND TABLE_NAME = 'congestionDetails')
	BEGIN
	CREATE TABLE [mobility].[congestionDetails](
	Id VARCHAR(250) PRIMARY KEY,
    [date] date  NULL,
	[hour] int NULL,
    [totalVehicles] int NULL,
    [totalAVs] int NULL,
	[intersectionName] VARCHAR(150) NULL,
	[actualCongestion] float NULL,
	[predictedCongestion] float NULL,
	[areaName] VARCHAR(150) NULL,
	[longitude] float  NULL,
    [latitude] float NULL,
	[tenantCode] VARCHAR(50) NULL
	)
	END

GO


----------------------------------------------------------------------Waste Management Tables--------------------------------------------------------------------------------

IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'waste' AND TABLE_NAME = 'binDetails')
	BEGIN
	CREATE TABLE [waste].[binDetails](
	[cbsmId_pk] [int] PRIMARY KEY NOT NULL,
	[cbsmBinId] [int] NULL,
	[cbsmCreatedDate] [datetime] NULL,
	[cbmHouseNo] [varchar](250) NULL,
	[cbmBinStatus] [int] NULL,
	[cbsmBinName] [varchar](250) NULL,
	[cbsmLocation] [varchar](550) NULL,
	[cbsmBinLatitude] [float] NULL,
	[cbsmBinLongitude] [float] NULL,
	[cbsmBinSensorCapasity] [float] NULL,
	[cbsmUlbId_fk] [int] NULL,
	)
	END

GO

IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'waste' AND TABLE_NAME = 'garbageWeightDetails')
	BEGIN
	CREATE TABLE [waste].[garbageWeightDetails](
	   [Id] nvarchar(250) PRIMARY KEY NOT NULL
	  ,[SLN] INT
      ,[dumpName] VARCHAR(250)
      ,[dumpWeight] FLOAT
      ,[recWeight] FLOAT
      ,[tareWeight] FLOAT
      ,[vehiclecount] INT
      ,[tripcount] INT
      ,[gdg_ulb_id_fk] INT
      ,[gdg_zoneId] INT
      ,[gdg_wardId] INT
      ,[zone] VARCHAR(250)
      ,[ward] VARCHAR(250)
      ,[date] date
	)
	END

GO

IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'waste' AND TABLE_NAME = 'doorToDoorBinCollection')
	BEGIN
	CREATE TABLE [waste].[doorToDoorBinCollection](
	   [Id] nvarchar(250) PRIMARY KEY NOT NULL
      ,czmZoneName VARCHAR(150)
      ,cwmWardName VARCHAR(150)
      ,bcdrZoneId int
      ,dbcdrWardId INT
      ,date date
      ,[total] Int
      ,[collected] INT
      ,[notcollected] INT
      ,[dbcdr_ulb_id_fk] INT
	)
	END

GO

-------------------------------parkingDetails-------------------------------------------------------------------------

IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'mobility' AND TABLE_NAME = 'parkingDetails')
	BEGIN
	CREATE TABLE [mobility].[parkingDetails](
	Id VARCHAR(250) PRIMARY KEY,
	[date] date NULL,
	[hour] int NULL,
    [bayId] varchar(50),
	[longitude] float  NULL,
    [latitude] float NULL,
	[areaName] VARCHAR(150) NULL,
	[bayStatus] varchar(50) NULL,
	[tenantCode] VARCHAR(50) NULL
   )
	END

GO

-------------------------------pedestrianDetails-----------------------------------------------------------------------

IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'mobility' AND TABLE_NAME = 'pedestrianDetails')
	BEGIN
	CREATE TABLE [mobility].[pedestrianDetails](
	Id VARCHAR(250) PRIMARY KEY,
	[date] date NULL,
	[hour] int NULL,
    [IntersectionName] varchar(200),
	[longitude] float  NULL,
    [latitude] float NULL,
	[areaName] VARCHAR(150) NULL,
	[actualPedestrianCount] int null,
	[predictedPedestrianCount] int null,
	[tenantCode] VARCHAR(50) NULL
   )
	END

GO

-------------------------------vehicleDetails-----------------------------------------------------------------------

IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'mobility' AND TABLE_NAME = 'vehicleDetails')
	BEGIN
	CREATE TABLE [mobility].[vehicleDetails](
	Id VARCHAR(200),
    vehicleNo VARCHAR(100),
    ownerName VARCHAR(150),
    areaName VARCHAR(150),
    latitude FLOAT,
    longitude FLOAT,
    date DATE
   )
	END

GO

-------------------------------buildingDetails-----------------------------------------------------------------------

IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'building' AND TABLE_NAME = 'buildingDetails')
	BEGIN
	CREATE TABLE [building].[buildingDetails](
		[Id] [nvarchar](250) NOT NULL UNIQUE,
	[hazardMaterial] [nvarchar](500) NULL,
	[uniqueId] [nvarchar](500) PRIMARY KEY  NOT NULL,
	[facilityInformation] [nvarchar](500) NULL,
	[tollFreeNumber] [nvarchar](50) NULL,
	[fireResistanceMaterial] [nvarchar](500) NULL,
	[constructionMaterial] [nvarchar](500) NULL,
	[isToxicMaterialPresent] [varchar](20) NULL,
	[bluePrint] [nvarchar](2500) NULL,
	[buildingImage] [nvarchar](2500) NULL,
	[fireToleranceMaterial] [nvarchar](2500) NULL,
	[roof] [nvarchar](2500) NULL,
	[wall] [nvarchar](2500) NULL,
	[framing] [nvarchar](2500) NULL,
	[peopleOccupancy] [int] NULL,
	[peopleCapacity] [int] NULL,
	[workingHour] [varchar](20) NULL,
	[floorsbelowground] [int] NULL,
	[floorsaboveground] [int] NULL,
	[mobileNumber] [nvarchar](20) NULL,
	[inchargeName] [varchar](250) NULL,
	[containedPlace] [nvarchar](2500) NULL,
	[tileseturl] [nvarchar](2500) NULL,
	[modelurl] [nvarchar](2500) NULL,
	[viewrotationz] [float] NULL,
	[viewrotationy] [float] NULL,
	[viewrotationx] [float] NULL,
	[viewpositionz] [float] NULL,
	[viewpositiony] [float] NULL,
	[viewpositionx] [float] NULL,
	[rotationz] [float] NULL,
	[rotationy] [float] NULL,
	[rotationx] [float] NULL,
	[positionz] [float] NULL,
	[positiony] [float] NULL,
	[positionx] [float] NULL,
	[buildingType] [varchar](250) NULL,
	[maximumOccupancy] [int] NULL,
	[noOfFloors] [int] NULL,
	[address] [nvarchar](2500) NULL,
	[longitude] [float] NULL,
	[latitude] [float] NULL,
	[buildingName] [varchar](250) NULL,
	[buildingId] [varchar](20) NULL,
	[tenantCode] [varchar](50) NULL,
	[areaName] [varchar](250) NULL,
   )ON [PRIMARY]
	END

GO

IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'safety' AND TABLE_NAME = 'fireEngineDetails')
	BEGIN
	CREATE TABLE [safety].[fireEngineDetails](
	[Id] [varchar](50) NOT NULL primary key,
	[availability] [varchar](50) NULL,
	[callSign] [varchar](50) NULL,
	[engineNumber] [varchar](50) NULL,
	[features] [varchar](400) NULL,
	[fireEngineId] [int] NOT NULL,
	[fireEngineName] [varchar](255) NULL,
	[fireStationId] [int] NULL,
	[fleetTypeCode] [varchar](50) NULL,
	[fuelType] [varchar](50) NULL,
	[Longitude] [float] NULL,
	[Latitude] [float] NULL,
	[manufactureDate] [datetime] NULL,
	[macId] [varchar](250) NULL,
	[numberPlateIdentifier] [varchar](50) NULL,
	[pumpStatus] [varchar](50) NULL,
	[serviceProvided] [varchar](255) NULL,
	[status] [varchar](50) NULL,
	[transmission] [varchar](50) NULL,
	[vehicleType] [int] NULL,
	[waterTankCapacity] [int] NULL,
	[tenantCode] [varchar](50) NULL,
	[equipmentList] [varchar](500) NULL,
	[fuelLevel] [varchar](50) NULL,
	[waterLevel] [varchar](50) NULL,
	[foamSystemType] [varchar](50) NULL,
	[fuelCapacityInLiters] [varchar](50) NULL,
	[manufacturer] [varchar](250) NULL,
	[foamLevel] [varchar](50) NULL,
	[fk_fireStationId] [nvarchar](150) NULL,
	[horsepower] [varchar](50) NULL,
	[seatingCapacity] [varchar](50) NULL,
	[maximumSpeed] [varchar](50) NULL,
	[mileage] [varchar](50) NULL,
	[registerdDate] [datetime] NULL,
	[vehicleWeightInKgs] [varchar](150) NULL,
	[foamTankCapacity] [varchar](150) NULL,
	[agency] [varchar](150) NULL,
	[assignedDevices] [nvarchar](1000) NULL,
	[operationalStatus] [varchar](150) NULL,
	[lastMaintenance] [datetime] NULL,
	[jurisdictionId] [varchar](150) NULL,
	[nodeId] [varchar](150) NULL,
	[equipmentAvailabilityInPercentage] [varchar](150) NULL,
	)
	END
GO

IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'safety' AND TABLE_NAME = 'fireStationDetails')
	BEGIN
	CREATE TABLE [safety].[fireStationDetails](
	[Id] [varchar](50) NOT NULL primary key,
	[fireStationId] [int] NOT NULL,
	[fireStationName] [varchar](250) NULL,
	[address] [nvarchar](max) NULL,
	[noOfFloors] [int] NULL,
	[buildingType] [varchar](50) NULL,
	[modelurl] [nvarchar](max) NULL,
	[jurisdictionId] [varchar](50) NULL,
	[peopleOccupancy] [int] NULL,
	[buildingImage] [nvarchar](max) NULL,
	[ownerName] [varchar](100) NULL,
	[Latitude] [float] NULL,
	[Longitude] [float] NULL,
	[tenantCode] [varchar](50) NULL,
	[ownerNumber] [varchar](150) NULL,
	[ownerEmail] [nvarchar](500) NULL,
	[inchargeName] [varchar](100) NULL,
	[inchargeNumber] [varchar](150) NULL,
	[inchargeEmail] [nvarchar](500) NULL,
	[floorsAboveGround] [varchar](50) NULL,
	[floorsBelowGround] [varchar](50) NULL,
	[workingHour] [varchar](50) NULL,
	[tollFreeNumber] [varchar](150) NULL,
	[rating] [varchar](50) NULL,
	[availability] [varchar](50) NULL,
	[nodeId] [varchar](50) NULL,
	[fireAgencyId] [varchar](50) NULL,
	[buildingId] [varchar](50) NULL,
	[stationReadiness] [varchar](50) NULL,
	[vehicleReadiness] [varchar](50) NULL,
	[staffReadiness] [varchar](50) NULL,
	[waterLevel] [varchar](50) NULL,
	[foamLevel] [varchar](50) NULL,
	[fuelLevel] [varchar](50) NULL,
	[equipmentLevel] [varchar](50) NULL,
	)
	END
GO

IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'building' AND TABLE_NAME = 'workforceDetails')
	BEGIN
	CREATE TABLE [building].[workforceDetails](
	[Id] [nvarchar](100) NOT NULL primary key,
	[name] [varchar](100) NULL,
	[attendance] [varchar](50) NULL,
	[fitness] [varchar](50) NULL,
	[skillset] [varchar](50) NULL,
	[training] [varchar](50) NULL,
	[role] [varchar](100) NULL,
	[workingHour] [varchar](50) NULL,
	[resourceId] [varchar](100) NULL,
	[fireStationId] [varchar](50) NULL,
	[workforceUserId] [varchar](100) NULL,
	[nodeId] [varchar](50) NULL,
	[tenantCode] [varchar](50) NULL,
	)
	END
GO


IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'building' AND TABLE_NAME = 'floorDetails')
	BEGIN
	CREATE TABLE [building].[floorDetails](
	[Id] [nvarchar](250) NOT NULL UNIQUE,
	[floorId] [nvarchar](20) NULL,
	[level] [int] NULL,
	[buildingId_fk] [nvarchar](150) NULL,
	[fileurl] [nvarchar](2000) NULL,
	[description] [nvarchar](500) NULL,
	[tilesetUrl] [nvarchar](2000) NULL,
	[floorUniqueId] [nvarchar](500) PRIMARY KEY NOT NULL,
	[modelurl] [nvarchar](2000) NULL,
	[viewrotationz] [float] NULL,
	[viewrotationy] [float] NULL,
	[viewrotationx] [float] NULL,
	[viewpositionz] [float] NULL,
	[viewpositiony] [float] NULL,
	[viewpositionx] [float] NULL,
	[rotationz] [float] NULL,
	[rotationy] [float] NULL,
	[rotationx] [float] NULL,
	[positionz] [float] NULL,
	[positiony] [float] NULL,
	[positionx] [float] NULL,
	[longitude] [float] NULL,
	[latitude] [float] NULL,
	[floorName] [varchar](250) NULL,
	[tenantCode] [varchar](50) NULL,
   )ON [PRIMARY]
	END

GO


IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'building' AND TABLE_NAME = 'roomDetails')
	BEGIN
	CREATE TABLE [building].[roomDetails](
	Id NVARCHAR(250) PRIMARY KEY NOT NULL,
	[PK_Room_id] [int] NOT NULL,
	[name] [nvarchar](max) NULL,
	[dimension] [nvarchar](max) NULL,
	[geomType] [nvarchar](max) NULL,
	[coordinates] [nvarchar](max) NULL,
	[roomType] [nvarchar](max) NULL,
	[floorId] [int] NOT NULL,
	[positionx] [float] NULL,
	[positiony] [float] NULL,
	[positionz] [float] NULL,
	[rotationx] [float] NULL,
	[rotationy] [float] NULL,
	[rotationz] [float] NULL,
	[viewpositionx] [float] NULL,
	[viewpositiony] [float] NULL,
	[viewpositionz] [float] NULL,
	[viewrotationx] [float] NULL,
	[viewrotationy] [float] NULL,
	[viewrotationz] [float] NULL,
	[fileurl] [nvarchar](max) NULL,
	[fileurl_file_uuid] [nvarchar](100) NULL,
	[modelurl] [nvarchar](max) NULL,
	[modelurl_file_uuid] [nvarchar](100) NULL,
	[description] [nvarchar](max) NULL,
	[tileseturl] [nvarchar](max) NULL,
	[roomNumber] [nvarchar](350) NULL,
	[roomContactNumber] [nvarchar](max) NULL,
	[roomBluePrint] [nvarchar](max) NULL,
	[roomBluePrint_file_uuid] [nvarchar](100) NULL,
	[node_id] [nvarchar](250) NULL,
	fk_floorId NVARCHAR(150) NOT NULL,
	tenantCode NVARCHAR(50) NOT NULL
   )ON [PRIMARY]
	END

GO
-------------------------------equipmentDetails-----------------------------------------------------------------------

IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'building' AND TABLE_NAME = 'equipmentDetails')
	BEGIN
	CREATE TABLE [building].[equipmentDetails](
	Id VARCHAR(200) PRIMARY KEY NOT NULL,
    equipmentId VARCHAR(100) NOT NULL,
    equipmentName VARCHAR(150),
    equipmentType VARCHAR(50),
    buldingId VARCHAR(100),
    floorId INT,
    createdDate DATE,
	updatedDate DATE,
	expiryDate DATE
   )ON [PRIMARY]
	END

GO


-------------------------------trinityEChallanDetails-----------------------------------------------------------------------
IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'mobility' AND TABLE_NAME = 'trinityEChallanDetails')
	BEGIN
CREATE TABLE [mobility].[trinityEChallanDetails](
	[ID] [nvarchar](50) NULL,
	[DATE] [date] NULL,
	[DATE_TIME] [datetime] NULL,
	[MAC] [nvarchar](50) NULL,
	[district] [nvarchar](50) NULL,
	[circle_name] [nvarchar](50) NULL,
	[challan_no] [nvarchar](50) NULL,
	[rc_no] [nvarchar](50) NULL,
	[lat_long] [nvarchar](50) NULL,
	[challan_remark] [nvarchar](50) NULL,
	[challan_date] [datetime] NULL,
	[challan_amount] [int] NULL,
	[challan_status] [nvarchar](50) NULL,
	[payment_date] [datetime] NULL,
	[payment_source] [nvarchar](50) NULL,
	[transaction_id] [nvarchar](50) NULL,
	[send_to_court_date] [datetime] NULL,
	[court_name] [nvarchar](50) NULL,
	[offences] [nvarchar](50) NULL,
	[challan_place] [nvarchar](50) NULL,
	[violater_type] [nvarchar](50) NULL,
	[challaning_officer_user_id] [nvarchar](50) NULL,
	[challaning_officer_name] [nvarchar](50) NULL,
	[vehicle_class] [nvarchar](50) NULL
) ON [PRIMARY]
 END
GO



-------------------------------WeatherDetails-----------------------------------------------------------------------
IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'weather' AND TABLE_NAME = 'weatherDetails')
	BEGIN
CREATE TABLE [weather].[weatherDetails](
	[Id] [nvarchar](250) NOT NULL primary key,
	[mac] [nvarchar](250) NOT NULL,
	[no2] FLOAT NULL,
	[noise] FLOAT NULL,
	[ns] VARCHAR(50) NULL,
	[o3] FLOAT NULL,
	[pm1] FLOAT NULL,
	[pm10] FLOAT NULL,
	[pm25] FLOAT NULL,
	[ps] VARCHAR(50)  NULL,
	[rain] FLOAT NULL,
	[so2] FLOAT NULL,
	[temperature] FLOAT NULL,
	[time] INT NULL,
	[uv] FLOAT NULL,
	[wd] FLOAT NULL,
	[wlvl] FLOAT NULL,
	[wp] FLOAT NULL,
	[ws] FLOAT NULL,
	[deviceName] VARCHAR(250) NULL,
	[deviceType]  VARCHAR(250)  NULL,
	[latitude] FLOAT NULL,
	[location] VARCHAR(350) NULL,
	[longitude] FLOAT NULL,
	[tenantCode] VARCHAR(50) NULL,
	[aqi] FLOAT NULL,
	[co] FLOAT NULL,
	[co2] FLOAT NULL,
	[date] date NULL,
	[hour] int NULL,
	[humidity] FLOAT NULL,
	[light] FLOAT NULL,
	[rh][nvarchar](50) NULL,
	[atmp][nvarchar](50) NULL,
	[dpt] [nvarchar](50) NULL
) 
 END
GO



----------------------------------Mobility.vehicletrackDetails -------------------------------------
IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'mobility' AND TABLE_NAME = 'vehicleTrackDetails')
	BEGIN
CREATE TABLE [mobility].[vehicleTrackDetails](
    [id] nvarchar(100) not null primary key,
    [vehicleId] varchar(50),
    [vehicleCallSign] varchar(50),
    [LastUpdatedTime] datetime,
    [districtCity] varchar(100),
    [policeStation] varchar(100),
    [gpsIMEI] varchar(50),
    [gpsMobileNumber] varchar(20),
    [vehicleType] varchar(50),
    [loginStatus] varchar(50),
    [trackStatus] varchar(50),
    [patrolAreaName] varchar(50),
    [patrolType] varchar(50),
    [patrolLocation] nvarchar(250),
    [patrolLatitude] float,
    [patrolLongitude] float,
    [statusId] int,
    [companyCode] varchar(50),
    [patrolName] varchar(50),
    [loginUser] varchar(50),
    [loginTime] datetime,
    [logoutTime] datetime,
    [duration] varchar(50),
    [fleetLatitude] float,
    [fleetLongitude] float,
    [missionStatus] varchar(50),
    [mdtReceivedTime] datetime,
    [atSceneTime] varchar(50),
    [pendingCount] int,
    [mdtClose] int,
    [cfsCount] int,
    [OpenMr] varchar(50),
    [closedMr] varchar(50)
	) 
end
GO


-------------------------------trinityRejectedEChallanDetails-----------------------------------------------------------------------
IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'iot' AND TABLE_NAME = 'trinityRejectedEChallanDetails')
	BEGIN
CREATE TABLE [iot].[trinityRejectedEChallanDetails](
	[ID] [nvarchar](50) NOT NULL primary key,
	[District] [nvarchar](50) NULL,
	[rc_no] [nvarchar](50) NULL,
	[latitude] [float] NULL,
	[longitude] [float] NULL,
	[challan_remark] [nvarchar](50) NULL,
	[challan_date] [datetime] NULL,
	[challan_amount] [nvarchar](50) NULL,
	[challan_status] [nvarchar](50) NULL,
	[transaction_id] [nvarchar](50) NULL,
	[offences] [nvarchar](50) NULL,
	[challan_place] [nvarchar](50) NULL,
	[challaning_officer_user_id] [nvarchar](50) NULL,
	[challaning_officer_name] [nvarchar](50) NULL,
	[vehicle_class] [nvarchar](50) NULL
) 
END
GO



IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'weather' AND TABLE_NAME = 'environmentCategory')
	BEGIN
CREATE TABLE [weather].[environmentCategory](
	[Id] VARCHAR(250) NOT NULL PRIMARY KEY,
	[catogory] [varchar](50) NULL,
	[availability] [float] NULL,
	[date] [date] NULL
) 
END
GO

--------------------- trinityRespond --------------------------------------
IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'emergency' AND TABLE_NAME = 'CallTypes')
	BEGIN
CREATE TABLE [emergency].[callTypes](
	[Id] [varchar](250) NOT NULL primary key,
	[callerTime] [datetime] NULL,
	[eventId] [varchar](150) NULL,
	[calltakerUsername] [varchar](200) NULL,
	[origWsId] [int] NULL,
	[missionStatus] [int] NULL,
	[callType] [int] NULL,
	[createdDate] [datetime] NULL,
	[createdUser] [varchar](150) NULL,
	[mainStatusId] [int] NULL,
	[targetUser] [varchar](150) NULL,
	[sourceType] [int] NULL,
	[missionStatusCode] [nvarchar](150) NULL,
	[isHotEvent] [int] NULL,
	[companyCode] [varchar](150) NULL,
	[loginName] [varchar](150) NULL,
	[loginStatus] [varchar](150) NULL,
	[userRolesDescription] [varchar](150) NULL,
	[userTypeId] [int] NULL,
	[overDueCall] [nvarchar](150) NULL,
	[callTakerOverdueTime] [nvarchar](150) NULL,
	[dispatcherEndTime] [datetime] NULL,
	[logCallerStartTime] [datetime] NULL,
	[logCallerEndTime] [datetime] NULL,
	[actionStartTime] [datetime] NULL,
	[dispatcherUserName] [varchar](50) NULL,
	[dispatcherStartTime] [datetime] NULL,
	[dispatcherEventId] [varchar](30) NULL,
	[callDisconnectedTime] [datetime] NULL,
	[callDuration] [int] NULL,
	[callerName] [varchar](100) NULL,
	[callerNumber] [nvarchar](20) NULL,
	[vehicleId] [nvarchar](100) NULL,
	[mainEventTypeName] [varchar](100) NULL,
	[subEventTypeName] [nvarchar](100) NULL,
	[cityName] [varchar](100) NULL,
	[stationName] [varchar](100) NULL,
	[callRecordingPath] [nvarchar](500) NULL,
	[responseTimeMDT] [int] NULL,
	[overallResponseTime] [int] NULL,
	[callerCreatedDate] [datetime] NULL,
	[sosEventId] [nvarchar](150) NULL,
	[registeredUser] [varchar](150) NULL,
	[contactNumber] [varchar](250) NULL,
	[age] [int] NULL,
	[emergencyContact] [nvarchar](max) NULL,
	[genderName] [varchar](150) NULL,
	[arrivedTime] [datetime] NULL,
	[mdtReceivedTime] [datetime] NULL,
	[coResponseTime] [int] NULL,
	[doResponseTime] [int] NULL,
	[eventSourceCode] [nvarchar](50) NULL,
	[eventSourceName] [varchar](100) NULL,
	[callTypeCode] [nvarchar](25) NULL,
	[priorityId] [int] NULL,
	[priorityName] [varchar](50) NULL,
	[callerLattitude] [float] NULL,
	[callerLongitude] [float] NULL,
	[callerAddress] [nvarchar](500) NULL,
	[agencyName] [varchar](50) NULL,
	[userTypeCode] [nvarchar](50) NULL,
	[callAnswerTime] [datetime] NULL,
	[distressLatitude] [float] NULL,
	[distressLongitude] [float] NULL,
	[requestDate] [datetime] NULL,
	[policeNarrative] [nvarchar](100) NULL,
	[distressName] [varchar](100) NULL,
	[distressAddress] [nvarchar](500) NULL,
    [acknowledgeTime] [datetime] NULL
)
end 
GO



-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------

IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'emergency' AND TABLE_NAME = 'specialLocation')
	BEGIN
	
	
CREATE TABLE [emergency].[specialLocation](
	[Id] [nvarchar](1) NOT NULL primary key,
	[zoneId] [int] NOT NULL,
	[latitude] [float] NOT NULL,
	[longitude] [float] NOT NULL,
	[zoneName] [nvarchar](500) NOT NULL,
	[status] [bit] NOT NULL,
	[tenantCode] [varchar](100) NULL
) 
end 
GO

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'emergency' AND TABLE_NAME = 'OperatorWiseHistory')

	BEGIN

CREATE TABLE [emergency].[OperatorWiseHistory](
	[Id] [nvarchar](250) NOT NULL primary key,
	[operatorName] [varchar](250) NULL,
	[loginName] [varchar](100) NULL,
	[operatorId] [int] NOT NULL,
	[totalWorkTime] [int] NULL,
	[totalBreakTime] [int] NULL,
	[loginTime] [datetime] NULL,
	[logoutTime] [datetime] NULL,
	[UserRoleDescription] [varchar](250) NULL,
	[companyCode] [varchar](100) NULL
) 
end
GO

----------------------------------cep -------------------------------------

IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'cep' AND TABLE_NAME = 'logGrievanceDetails')
	BEGIN
	
	
CREATE TABLE [cep].[logGrievanceDetails](
	[ID] [nvarchar](100) NOT NULL primary key,
	[grievanceId] [nvarchar](50) NOT NULL,
	[name] [varchar](70) NULL,
	[phoneNumber] [nvarchar](15) NULL,
	[address] [nvarchar](500) NULL,
	[userRemarks] [varchar](300) NULL,
	[grievancereceivedTime] [datetime] NULL,
	[latitude] [float] NULL,
	[longitude] [float] NULL,
	[requestTypeId] [int] NULL,
	[statusId] [int] NULL,
	[grievanceUpdatedTime] [datetime] NULL,
	[location] [nvarchar](300) NULL,
	[status] [varchar](50) NULL,
	[tenantCode] [varchar](50) NULL,
	[incidentId] [varchar](25) NULL,
	[incidentCreatedTime] [datetime] NULL,
	[rating] [int] NULL,
	[incidentUpdatedTime] [datetime] NULL,
	[callendTime] [datetime] NULL,
	[callStartTime] [datetime] NULL,
	[remarks] [nvarchar](1000) NULL,
	[priority] [varchar](25) NULL,
	[channelType] [varchar](100) NULL,
	[incidentType] [varchar](100) NULL,
	[departmentName] [varchar](100) NULL,
	[gender] [varchar](100) NULL,
	[email] [nvarchar](70) NULL,
	[incidentSubType] [varchar](100) NULL,
	[userCreatedDate] [datetime] NULL,
	[agentRemarks] [nvarchar](300) NULL,
	[userName] [varchar](70) NULL,
	[dateOfBirth] [datetime] NULL,
	[nationalId] [varchar](100) NULL,
	[currentAccount] [varchar](100) NULL,
	[userId] [varchar](50) NULL,
	
    )
end 
GO
----------------------------------cep -------------------------------------

IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'revenue' AND TABLE_NAME = 'propertyTax')
	BEGIN


CREATE TABLE [revenue].[propertyTax](
	[ID] [float] NULL,
	[MAC] [nvarchar](255) NULL,
	[category] [nvarchar](255) NULL,
	[month] [float] NULL,
	[mslno] [float] NULL,
	[ptins] [float] NULL,
	[taxableamount] [float] NULL,
	[totaltaxpaid] [float] NULL,
	[totaltaxpending] [float] NULL,
	[DATE] [datetime] NULL,
	[DATE_TIME] [datetime] NULL,
	[due_start] [datetime] NULL,
	[due_end] [datetime] NULL,
	[locality] [nvarchar](255) NULL,
	[mobileno] [float] NULL,
	[name] [nvarchar](255) NULL,
	[pltyonarrs] [float] NULL,
	[pltyoncrn] [float] NULL,
	[revenueWard] [nvarchar](255) NULL,
	[total] [float] NULL,
	[ulbname] [nvarchar](255) NULL,
	[usage] [nvarchar](255) NULL,
	[zone] [nvarchar](255) NULL,
	[asstType] [nvarchar](255) NULL,
	[block] [nvarchar](255) NULL,
	[revenueWardName] [nvarchar](255) NULL,
	[commercial] [float] NULL,
	[mixed] [float] NULL,
	[residential] [float] NULL,
	[countryRank] [float] NULL
)ON [PRIMARY]
end
GO


IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'safety' AND TABLE_NAME = 'workforceDetails')
	BEGIN
	CREATE TABLE [safety].[workforceDetails](
	[engineName] [nvarchar](255) NULL,
	[equipmentList] [nvarchar](max) NULL,
	[engineId] [int] NULL,
	[features] [nvarchar](max) NULL,
	[serviceProvided] [nvarchar](255) NULL,
	[resourcePhoto] [nvarchar](max) NULL,
	[resourceRoleId] [nvarchar](50) NULL,
	[workforceLoginName] [nvarchar](255) NULL,
	[workforceUserName] [nvarchar](255) NULL,
	[tenantCode] [varchar](350) NULL,
	[captainName] [varchar](255) NULL,
	[incidentName] [varchar](355) NULL,
	[esopId] [int] NULL,
	[responseEndTime] [datetime] NULL,
	[responseStartTime] [datetime] NULL,
	[workforceUserId] [int] NULL,
	[incidentId] [varchar](255) PRIMARY KEY NOT NULL
	) ON [PRIMARY]
	END
	GO

IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'revenue' AND TABLE_NAME = 'waterTax')
	BEGIN
	CREATE TABLE [revenue].[waterTax](
	[ID] [float] NULL,
	[MAC] [nvarchar](255) NULL,
	[block] [nvarchar](255) NULL,
	[commercial] [float] NULL,
	[mixed] [float] NULL,
	[residential] [float] NULL,
	[revenueWard] [float] NULL,
	[revenueWardName] [nvarchar](255) NULL,
	[DATE] [datetime] NULL,
	[DATE_TIME] [datetime] NULL,
	[category] [nvarchar](255) NULL,
	[totaltaps] [float] NULL,
	[taxableamount] [float] NULL,
	[totaltaxpaid] [float] NULL,
	[totaltaxpending] [float] NULL,
	[FYYEAR] [float] NULL,
	[MONTH] [float] NULL,
	[YEAR] [float] NULL,
	[cans] [float] NULL,
	[F20] [nvarchar](255) NULL
) ON [PRIMARY]
end
GO



----------------------------------iot.vehicleDetails -------------------------------------

IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'iot' AND TABLE_NAME = 'vehicleDetails')
	BEGIN
CREATE TABLE [iot].[vehicleDetails](
	[FleetName] [nvarchar](200) NULL,
	[fleetNumber] [nvarchar](200) NULL,
	[ChassisNo] [nvarchar](50) NULL,
	[brand] [nvarchar](200) NULL,
	[AssignedStatus] [bit] NULL,
	[ManufactureDate] [datetime] NULL
) ON [PRIMARY]
end
GO


-------------------------------------cafm tables-------------------------------------------------------------
IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'building' AND TABLE_NAME = 'cafmDetails')
	BEGIN
	CREATE TABLE [building].[cafmDetails](
	[cafmId] [nvarchar](255) NOT NULL primary key,
	[cafmStatus] [nvarchar](255) NULL,
	[Date/Time] [datetime] NULL,
	[buildingId] [nvarchar](255) NULL,
	[incidentId] [nvarchar](255) NULL,
	[alertId] [nvarchar](255) NULL,
	[alertPriority] [nvarchar](255) NULL,
	[incidentPriority] [nvarchar](255) NULL,
	[longitude] [float] NULL,
	[latitude] [float] NULL,
	[incidentName] [varchar](200) NULL
	) 
END
GO

------------------------------------SafetyCategory---------------------------------------
IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'safety' AND TABLE_NAME = 'safetyCategory')
BEGIN
CREATE TABLE [safety].[safetyCategory](
    [ID][nvarchar](50) not null primary key,
	[time] [datetime] NULL,
	[Police] [float] NULL,
	[fireFighter] [float] NULL,
	[ Emergency] [float] NULL
) 
END
GO

------------------------------------fleetDetails---------------------------------------
IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'mobility' AND TABLE_NAME = 'fleetDetails')
BEGIN
CREATE TABLE [mobility].[fleetDetails](
	[fleetId] [nvarchar](255) NOT NULL primary key,
	[time] [datetime] NULL,
	[incidentId] [nvarchar](255) NULL,
	[incidentStatus] [nvarchar](255) NULL
) 
END
GO


------------------------------------evDetails---------------------------------------
IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'mobility' AND TABLE_NAME = 'evDetails')
BEGIN
CREATE TABLE [mobility].[evDetails](
	[id] [nvarchar](255) NOT NULL primary key,
	[evStatus] [nvarchar](255) NULL,
	[incidentId] [nvarchar](255) NULL,
	[incidentStatus] [nvarchar](255) NULL
) 
END
GO

------------------------------------staffDetails---------------------------------------
IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'employee' AND TABLE_NAME = 'staffDetails')
	BEGIN
CREATE TABLE [employee].[staffDetails](
	[staffId] [nvarchar](255) NOT NULL primary key,
	[status] [nvarchar](255) NULL,
	[requestId] [nvarchar](255) NULL,
	[request Priority] [nvarchar](255) NULL
) 
END
GO

------------------------------------airDetails---------------------------------------
IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'mobility' AND TABLE_NAME = 'airDetails')
BEGIN
CREATE TABLE [mobility].[airDetails](
	[Id] [float] NOT NULL PRIMARY KEY,
	[time] [datetime] NULL,
	[incidentId] [nvarchar](255) NULL,
	[incidentStatus] [nvarchar](255) NULL
)
END
GO


-------------------------------------crm tables-------------------------------------------------------------
IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'building' AND TABLE_NAME = 'crmDetails')
	BEGIN
CREATE TABLE [building].[crmDetails] (
    [id] [nvarchar](250) NOT NULL primary key,
	[crmId] [nvarchar](255) NULL,
	[crmStatus] [nvarchar](255) NULL,
	[dateTime] [datetime] NULL,
	[incidentType] [varchar](150) NULL,
	[latitude] [float] NULL,
	[longitude] [float] NULL,
	[incidentPriority] [varchar](100) NULL
) 
END
GO

-------------------------------------icccDeviceDetails-------------------------------------------------------------
IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'iccc' AND TABLE_NAME = 'deviceDetails')
	BEGIN
	CREATE TABLE [iccc].[deviceDetails] (
	[deviceId] int not null primary key,
    [deviceName] nvarchar(100),
    [deviceTypeName] nvarchar(100),
    [category] nvarchar(100),
    [deviceCreatedDate] datetime,
    [deviceUpdatedDate] datetime,
    [companyCode] nvarchar(100),
    [deviceLocation] nvarchar(500),
    [juridictionName] nvarchar(500),
    [siteName] nvarchar(100),
    [status] varchar(11),
	[companyId] int NULL,
	[siteId] [int] NULL,
	[deviceTypeId] [int] NULL,
	[jurisdictionId] [int] NULL
)
END
GO


-------------------------------------iccctenantDetails-------------------------------------------------------------
IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'iccc' AND TABLE_NAME = 'tenantDetails')
	BEGIN
CREATE TABLE [iccc].[tenantDetails] (
    [companyName] nvarchar(500),
    [companyAddress] nvarchar(500),
    [createdDate] datetime,
    [companyDeviceKey] int,
    [companyUserKey] int,
    [expiryDate] datetime,
    [softDelete] bit,
    [userProvisioned] int,
    [sensorProvisioned] int,
    [companyStatus] bit,
    [companyId] int not null primary key,
    [companyStatusDescription] nvarchar(200),
    [companyCode] nvarchar(100),
    [contactPerson] nvarchar(200),
    [companyContact] nvarchar(max),
    [companyEmailId] nvarchar(max),
)
END
GO

-------------------------------------icccliscenceDetails-------------------------------------------------------------
IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'iccc' AND TABLE_NAME = 'licenceDetails')
	BEGIN
	CREATE TABLE [iccc].[licenceDetails] (
[licenceId] int not null primary key,
    [companyId] int,
    [licenceKey] nvarchar(100),
    [licenceKeyActiveStatus] bit,
    [licenceKeyUserType] nvarchar(100),
    [licenceKeyInstallationDate] datetime,
    [licenceKeyCreatedDate] datetime,
    [licenceKeyExpiredDate] datetime,
	)
END
GO

-------------------------------------icccWorkStationDetails-------------------------------------------------------------
IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'iccc' AND TABLE_NAME = 'workStationDetails')
	BEGIN
CREATE TABLE [iccc].[workStationDetails] (
    [CompanyId] int,
    [Duration] nvarchar(100),
    [Type] int,
    [RoleName] nvarchar(50),
    [ComponentId] int NOT NULL primary key,
    [LoginStatus] [nvarchar](25),
    [Ip] nvarchar(50),
    [UserName] nvarchar(50),
    [LoginTime] datetime,
    [LogoutTime] datetime,
    [CurrentRole] int,
	[statusId] int NULL
)
END
GO

------------------------------------------------ Forecast Consumption-----------------------------------------------------------------------

IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'water' AND TABLE_NAME = 'forecastConsumption')
	BEGIN
	CREATE TABLE [water].[forecastConsumption](
		[id] [nvarchar](250) PRIMARY KEY NOT NULL,
		[meterName] [varchar](200) NOT NULL,
		[date] [date] NOT NULL,
		[hour] [int] NULL,
		[meterType] [varchar](50) NULL,
		[forecastConsumption] [float] NULL,
		[forecastGreywater] [float] NULL,
		[forecastrevenue] [float] NULL,
		[tenantCode] [varchar](50) NULL
   )
	END

GO


IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'energy' AND TABLE_NAME = 'forecastConsumption')
	BEGIN
	CREATE TABLE [energy].[forecastConsumption](
		[Id] [nvarchar](250) NOT NULL,
		[date] [date] NOT NULL,
		[hour] [int] NULL,
		[mac] [varchar](255) NULL,
		[meterName] [varchar](250) NULL,
		[tenantCode] [varchar](50) NULL,
		[forecastConsumption] [float] NULL,
		[forecastrevenue] [float] NULL,
		[forecastEmmision] [float] NULL
   )
	END

GO

----*************************tagged Alarm Table******************************************
IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'iot' AND TABLE_NAME = 'taggedAlarm')
	BEGIN
	CREATE TABLE [iot].[taggedAlarm](
	[taggedId] [int] NOT NULL PRIMARY KEY,
	[alarmEventId] [nvarchar](max) NULL,
	[alarmMainId] [bigint] NULL,
	[description] [nvarchar](max) NULL,
	[taggedTime] [datetime] NULL,
	[createdBy] [nvarchar](max) NULL,
	[taggedType] [int] NULL
	)
	END
GO


-------------------------------------smartWaste tables-------------------------------------------------------------
IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'waste' AND TABLE_NAME = 'wasteDetails')
	BEGIN
CREATE TABLE [waste].[wasteDetails] (
    [id] [nvarchar](250) NOT NULL primary key,
	[binId] [nvarchar](255) NULL,
	[binCollectedStatus] [nvarchar](255) NULL,
	[binFillingStatus] [nvarchar](255) NULL,
	[vehicleId] [nvarchar](255) NULL,
	[vehicleStatus] [nvarchar](255) NULL,
	[wasteType] [nvarchar](255) NULL,
	[volumeCollected] [float] NULL,
	[areaCovered] [nvarchar](255) NULL,
	[duration] [datetime] NULL,
	[latitude] [float] NULL,
	[longitude] [float] NULL,
	[binStatus] [nvarchar](255) NULL,
	[weightCollected] [float] NULL,
	[actualConsumption] [float] NULL,
	[predictedConsumption] [float] NULL,
	[cluster] [nvarchar](255) NULL,
	[areaCoveredKm] [float] NULL,
	[vehicleName] [nvarchar](255) NULL,
	[predictedDate] [datetime] NULL,
	[collectionStatus] [nvarchar](255) NULL,
	[vehicleMainStatus] [nvarchar](255) NULL,
	[volumePriority] [nvarchar](150) NULL,
	[alertId] [nvarchar](100) NULL,
	[alertName] [varchar](150) NULL,
	[alertStatus] [varchar](50) NULL,
	[alertPriority] [varchar](50) NULL,
	[alertPredict] [varchar](100) NULL,
	[vehiclePredict] [varchar](100) NULL,
	[binPredict] [varchar](100) NULL,
	[density] [nvarchar](100) NULL
)  
END
GO


-------------------------------------v_energyConsumptionDetails view-------------------------------------------------------------

CREATE OR ALTER       VIEW [dbo].[v_energyConsumptionDetails] AS 
 SELECT energy.mac, energy.date, energy.hour, energy.energyConsumption, energy.latitude, energy.longitude, energy.tenantCode, assetUpDown.offDuration, assetUpDown.onDuration, 
 forecast.forecastConsumption, forecast.forecastrevenue, forecast.forecastEmmision
  FROM [trinityDatawarehouse].[energy].[consumptionDetails] energy
  LEFT JOIN [energy].[forecastConsumption] forecast 
   ON energy.mac = forecast.mac and energy.date = forecast.date
  LEFT JOIN [energy].[assetUpTimeDownTime] assetUpDown
  ON energy.mac = assetUpDown.macId and energy.date = assetUpDown.date
GO

-------------------------------------v_waterConsumptionDetails view-------------------------------------------------------------

CREATE OR ALTER   VIEW [dbo].[v_waterConsumptionDetails] AS
	SELECT water.*, forecast.forecastConsumption, forecast.forecastrevenue, forecast.forecastGreywater, assetUpDown.onDuration, assetUpDown.offDuration
  from [water].[consumptionDetails] water
  LEFT JOIN [water].[forecastConsumption] forecast
  ON water.meterId = forecast.meterName and water.date = forecast.date
  LEFT JOIN [water].[assetUpTimeDownTime] assetUpDown
  ON water.meterId = assetUpDown.macId and water.date = assetUpDown.date
GO


-------------------------------------v_meterConsumptionDetails view-------------------------------------------------------------


CREATE OR ALTER     VIEW [dbo].[v_meterConsumption] AS

SELECT water.date as date, water.meterId as meterId, water.actualConsumption as actualConsumption, water.actualGreywater as actualGreywater, water.greyWaterType as 
greyWaterType, water.latitude as latitude, water.longitude as longitude, water.tenantCode as tenantCode, water.hour as hour, water.revenue as revenue,water.wqi as wqi, 
water.wqi_bod as wqi_bod, water.wqi_cod as wqi_cod, water.wqi_dissolvedOxygen as wqi_dissolvedOxygen, water.wqi_pH as wqi_pH, water.wqi_tds as wqi_tds, 
water.wqi_temperature as wqi_temperature,water.wqi_turbidity as wqi_turbidity,  forecast.forecastConsumption as forecastConsumption, forecast.forecastrevenue as 
forecastrevenue, forecast.forecastGreywater as forecastGreywater, assetUpDown.onDuration as onDuration, assetUpDown.offDuration as offDuration, null as forecastEmmision, 
'water' as meterType, null as areaName, null as statusName, null as location, null as carbonFootprints, null as lumid, null as lampId, null as lcState,
null as schedulestatus
  from [water].[consumptionDetails] water
  LEFT JOIN [water].[forecastConsumption] forecast
  ON water.meterId = forecast.meterName and water.date = forecast.date
  LEFT JOIN [water].[assetUpTimeDownTime] assetUpDown
  ON water.meterId = assetUpDown.macId and water.date = assetUpDown.date

UNION ALL
(
 SELECT energy.date as date, energy.mac as meterId, energy.energyConsumption as actualConsumption, null as actualGreywater, null as greyWaterTypeenergy, 
 energy.latitude as latitude, energy.longitude as longitude, energy.tenantCode as tenantCode,energy.hour as hour, null as revenue, null as wqi, 
null as wqi_bod, null as wqi_cod, null as wqi_dissolvedOxygen, null as wqi_pH, null as wqi_tds, null as wqi_temperature,null as wqi_turbidity,  
forecast.forecastConsumption  as forecastConsumption,  forecast.forecastrevenue as forecastrevenue, null as forecastGreywater, 
assetUpDown.offDuration as offDuration, assetUpDown.onDuration as onDuration, forecast.forecastEmmision as forecastEmmision, 'energy' as meterType, 
null as areaName, null as statusName, null as location, null as carbonFootprints, null as lumid, null as lampId, null as lcState, null as schedulestatus
  FROM [trinityDatawarehouse].[energy].[consumptionDetails] energy
  LEFT JOIN [energy].[forecastConsumption] forecast 
   ON energy.mac = forecast.mac and energy.date = forecast.date
  LEFT JOIN [energy].[assetUpTimeDownTime] assetUpDown
  ON energy.mac = assetUpDown.macId and energy.date = assetUpDown.date

  )

  
  UNION ALL
(
 SELECT lighting.date as date, lighting.mac as meterId, lighting.Energy as actualConsumption, null as actualGreywater, null as greyWaterTypeenergy, 
 lighting.latitude as latitude, lighting.longitude as longitude, lighting.tenantCode as tenantCode,lighting.hour as hour, null as revenue, null as wqi, 
null as wqi_bod, null as wqi_cod, null as wqi_dissolvedOxygen, null as wqi_pH, null as wqi_tds, null as wqi_temperature,null as wqi_turbidity,  
forecast.forecastConsumption  as forecastConsumption,  forecast.forecastrevenue as forecastrevenue, null as forecastGreywater, 
assetUpDown.offDuration as offDuration, assetUpDown.onDuration as onDuration, forecast.forecastEmmision as forecastEmmision, 'lighting' as meterType, 
lighting.areaName as areaName, null as statusName, null as location, null as carbonFootprints, lighting.LUMID as lumid, lighting.LampId as lampId,
lighting.Lcstate as lcState, null as schedulestatus
  FROM [trinityDatawarehouse].[energy].[lightingConsumption] lighting
  LEFT JOIN [energy].[forecastConsumption] forecast 
   ON lighting.mac = forecast.mac and lighting.date = forecast.date
  LEFT JOIN [energy].[assetUpTimeDownTime] assetUpDown
  ON lighting.mac = assetUpDown.macId and lighting.date = assetUpDown.date

  )

    UNION ALL
(
 SELECT irrigation.date as date, irrigation.mac as meterId, irrigation.consumption as actualConsumption, null as actualGreywater, null as greyWaterTypeenergy, 
 irrigation.latitude as latitude, irrigation.longitude as longitude, irrigation.tenantCode as tenantCode,irrigation.hour as hour, null as revenue, null as wqi, 
null as wqi_bod, null as wqi_cod, null as wqi_dissolvedOxygen, null as wqi_pH, null as wqi_tds, null as wqi_temperature,null as wqi_turbidity,  
forecast.forecastConsumption  as forecastConsumption,  forecast.forecastrevenue as forecastrevenue, null as forecastGreywater, 
assetUpDown.offDuration as offDuration, assetUpDown.onDuration as onDuration, null as forecastEmmision, 'irrigation' as meterType, 
irrigation.areaName as areaName, irrigation.status as statusName, null as location, null as carbonFootprints, null as lumid, null as lampId,
null as lcState, irrigation.schedulestatus as schedulestatus
  FROM [trinityDatawarehouse].[water].[irrigationDetails] irrigation
  LEFT JOIN [water].[forecastConsumption] forecast 
   ON irrigation.mac = forecast.meterName and irrigation.date = forecast.date
  LEFT JOIN [water].[assetUpTimeDownTime] assetUpDown
  ON irrigation.mac = assetUpDown.macId and irrigation.date = assetUpDown.date

  )
GO

IF NOT EXISTS (SELECT 1 
               FROM sys.indexes 
               WHERE name = 'IX_water_consumptionDetails_meterId' 
               AND object_id = OBJECT_ID('[water].[consumptionDetails]'))
BEGIN
    CREATE NONCLUSTERED INDEX IX_water_consumptionDetails_meterId
    ON [water].[consumptionDetails] (meterId);
END

GO 

IF NOT EXISTS (SELECT 1 
               FROM sys.indexes 
               WHERE name = 'IX_water_forecastConsumption_meterName' 
               AND object_id = OBJECT_ID('[water].[forecastConsumption]'))
BEGIN
    CREATE NONCLUSTERED INDEX IX_water_forecastConsumption_meterName
    ON [water].[forecastConsumption] (meterName);
END

GO 

IF NOT EXISTS (SELECT 1 
               FROM sys.indexes 
               WHERE name = 'IX_water_assetUpTimeDownTime_macId' 
               AND object_id = OBJECT_ID('[water].[assetUpTimeDownTime]'))
BEGIN
    CREATE NONCLUSTERED INDEX IX_water_assetUpTimeDownTime_macId
    ON [water].[assetUpTimeDownTime] (macId);
END

GO

IF NOT EXISTS (SELECT 1 
               FROM sys.indexes 
               WHERE name = 'IX_energy_consumptionDetails_mac' 
               AND object_id = OBJECT_ID('[energy].[consumptionDetails]'))
BEGIN
    CREATE NONCLUSTERED INDEX IX_energy_consumptionDetails_mac
    ON [energy].[consumptionDetails] (mac);
END

GO

IF NOT EXISTS (SELECT 1 
               FROM sys.indexes 
               WHERE name = 'IX_energy_forecastConsumption_mac' 
               AND object_id = OBJECT_ID('[energy].[forecastConsumption]'))
BEGIN
    CREATE NONCLUSTERED INDEX IX_energy_forecastConsumption_mac
    ON [energy].[forecastConsumption] (mac);
END

GO

IF NOT EXISTS (SELECT 1 
               FROM sys.indexes 
               WHERE name = 'IX_energy_assetUpTimeDownTime_macId' 
               AND object_id = OBJECT_ID('[energy].[assetUpTimeDownTime]'))
BEGIN
    CREATE NONCLUSTERED INDEX IX_energy_assetUpTimeDownTime_macId
    ON [energy].[assetUpTimeDownTime] (macId);
END

GO

IF NOT EXISTS (SELECT 1 
               FROM sys.indexes 
               WHERE name = 'IX_water_consumptionDetails_meterId_date' 
               AND object_id = OBJECT_ID('[water].[consumptionDetails]'))
BEGIN
    CREATE NONCLUSTERED INDEX IX_water_consumptionDetails_meterId_date
    ON [water].[consumptionDetails] (meterId, date);
END

GO

IF NOT EXISTS (SELECT 1 
               FROM sys.indexes 
               WHERE name = 'IX_lighting_consumptionDetails_mac' 
               AND object_id = OBJECT_ID('[energy].[lightingConsumption]'))
BEGIN
    CREATE NONCLUSTERED INDEX IX_lighting_consumptionDetails_mac
    ON [energy].[lightingConsumption] (mac);
END

GO

IF NOT EXISTS (SELECT 1 
               FROM sys.indexes 
               WHERE name = 'IX_water_irrigationDetails_mac' 
               AND object_id = OBJECT_ID('[water].[irrigationDetails]'))
BEGIN
    CREATE NONCLUSTERED INDEX IX_water_irrigationDetails_mac
    ON [water].[irrigationDetails] (mac);
END

GO

IF NOT EXISTS (SELECT 1 
               FROM sys.indexes 
               WHERE name = 'IX_iot_assetDetails_mac' 
               AND object_id = OBJECT_ID('[iot].[assetDetails]'))
BEGIN
    CREATE NONCLUSTERED INDEX IX_iot_assetDetails_mac
    ON [iot].[assetDetails] (macId);
END

GO

IF NOT EXISTS (SELECT 1 
               FROM sys.indexes 
               WHERE name = 'IX_iot_alarmDetails_alarmId' 
               AND object_id = OBJECT_ID('[iot].[alarmDetails]'))
BEGIN
    CREATE NONCLUSTERED INDEX IX_iot_alarmDetails_alarmId
    ON [iot].[alarmDetails] (alarmId);
END

GO


----------------------------------------------iot.v_alarmDetails------------------------------------------------------------------------------

	CREATE  OR ALTER VIEW [dbo].[v_assetAlarmDetails] AS
		select asset.macId, asset.address, asset.companyCode,asset.categoryId, asset.deviceCreatedDate, asset.deviceName, asset.deviceTypeId, asset.deviceTypeName, asset.latitude, asset.longitude, asset.layoutTypeId, asset.statusId, asset.statusName, asset.deviceUpdatedDate, asset.assetTypeId, asset.assetTypeName,asset.isActive, asset.latitude as assetLatitute, asset.longitude as assetLongitute,	alarm.alarmId, alarm.alarmName,  alarm.alarmStatusId, alarm.alarmStatusName, alarm.alarmgeneratedTime, alarm.eventId, alarm.priorityName, alarm.priorityId, alarm.eventCreatedTime, alarm.sopActualTimeToClose, alarm.sourceTypeId, alarm.image,  CASE WHEN alarm.alarmAbandonTime is null and alarm.eventCreatedTime is not null and alarm.eventCreatedTime > alarm.alarmGeneratedTime THEN CONVERT(date, alarm.eventCreatedTime) ELSE CASE WHEN  alarm.alarmAbandonTime is not null  and alarm.alarmAbandonTime > alarm.alarmGeneratedTime THEN CONVERT(date, alarm.alarmAbandonTime) ELSE  CONVERT(date, alarm.alarmgeneratedTime) END END as 'Date'
 
	from iot.assetDetails asset   
	LEFT JOIN  iot.alarmDetails alarm 
	ON asset.macId = alarm.macId
	

GO

--------------------------------------------------------iot.eventDetails------------------------------------------------------------------------


CREATE OR ALTER VIEW  iot.v_eventDetails AS

SELECT TOP(3)
   eventId as eventId, alarmName as eventName ,
   eventDescription,
   image, eventCreatedTime as date  
   from iot.alarmDetails
   ORDER BY eventCreatedTime DESC 
GO

------------------------------------------------------safety.v_fireStationDetails-------------------------------------------------------------
CREATE OR ALTER VIEW  safety.v_fireStationDetails AS
	SELECT station.Id as pk_stationId, station.fireStationId, fireStationName, station.address, station.buildingType,
	station.Latitude, station.Longitude, station.tenantCode, engine.callSign, engine.engineNumber, engine.fireEngineId, 
	engine.fireEngineName, engine.Latitude as engineLatitude, engine.Longitude as engineLongitute, engine.waterTankCapacity, 
	engine.equipmentList, resources.resourceId, resources.resourceName, equipment.equipmentId, equipment.equipmentName
	 FROM [trinityDatawarehouse].[safety].[fireStationDetails] station
	 LEFT JOIN [safety].[fireEngineDetails] engine
	 ON station.Id = engine.fk_fireStationId
	 LEFT JOIN [safety].[fireStationWorkforceDetails] resources
	 ON engine.Id = resources.fk_fireEngineId
	 LEFT JOIN [safety].[fireEquipmentDetails] equipment
	 ON engine.Id = equipment.fk_fireEngineId
	 
GO


------------------------------------------------------swm-------------------------------------------------------------

IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'swm' AND TABLE_NAME = 'zoneDetails')
	BEGIN
	CREATE TABLE [swm].[zoneDetails](
	[zoneId] [int] NOT NULL primary key,
	[zoneName] [nvarchar](256) NULL,
	[tenantid] [int] NULL,
	[latitude] [float] NULL,
	[longitude] [float] NULL,
	)
	END
GO



IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'swm' AND TABLE_NAME = 'wardDetails')
	BEGIN
	CREATE TABLE [swm].[wardDetails](
	[wardId] [int] NOT NULL primary key,
	[tenantId] [int] NULL,
	[wardName] [nvarchar](256) NULL,
	[zoneId] [int] NULL,
	[latitude] [float] NULL,
	[longitude] [float] NULL,
	)
	END
GO



IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'swm' AND TABLE_NAME = 'vehicleStatus')
	BEGIN
	CREATE TABLE [swm].[vehicleStatus](
	[id] [nvarchar](250) NOT NULL primary key,
	[vehicleType] [nvarchar](150) NULL,
	[grossWeight] [float] NULL,
	[netWeight] [float] NULL,
	[tareWeight] [float] NULL,
	[transferStation] [varchar](256) NULL,
	[cfmId] [int] NULL,
	[dwdUpdatedDate] [datetime] NULL,
	[vehicleNumber] [varchar](50) NULL,
	[location] [nvarchar](250) NULL,
	[speed] [float] NULL,
	[trackingStatus] [varchar](100) NULL,
	[IgnitionStatus] [varchar](100) NULL,
	[batteryStatus] [varchar](150) NULL,
	[gpsStatus] [varchar](50) NULL,
	[zone] [nvarchar](256) NULL,
	[ward] [nvarchar](256) NULL,
	[receivedDate] [datetime] NULL,
	[vehicleDateTime] [datetime] NULL,
	[tenantCode] [varchar](50) NULL,
	[tripid] [int] NULL,
	[vomId] [int] NULL,
	)
	END
GO



IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'swm' AND TABLE_NAME = 'TripDetails')
	BEGIN
	CREATE TABLE [swm].[TripDetails](
	[vehicleNumber] [nvarchar](100) NOT NULL,
	[tripId] [int] NOT NULL primary key,
	[startTime] [datetime] NULL,
	[endTime] [datetime] NULL,
	[routeCoveredPercentage] [float] NULL,
	[collectedBins] [int] NULL,
	[uncollectedBins] [int] NULL,
	[TotalBin] [int] NULL,
	[shiftName] [nvarchar](250) NULL,
	[BinCoveredPercentage] [float] NULL,
	[tenantCode] [varchar](150) NULL,
	[zoneId] [int] NULL,
	[wardId] [int] NULL,
	[vehicleType] [varchar](150) NULL,
	[tripStatus] [int] NULL,
	[routeCovered] [int] NULL,
	[routeNotCovered] [int] NULL,
	[routeNotCoveredPercentage] [float] NULL,
	)
	END
GO


IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'swm' AND TABLE_NAME = 'alertSummaryDetails')
	BEGIN
	CREATE TABLE [swm].[alertSummaryDetails](
	[alertId] [int] NOT NULL,
	[vehicleId] [varchar](255) NULL,
	[alertType] [varchar](255) NULL,
	[receivedDateTime] [datetime] NULL,
	[latitude] [float] NULL,
	[longitude] [float] NULL,
	[location] [varchar](500) NULL,
	[tripId] [varchar](50) NULL,
	[tenantCode] [varchar](255) NULL,
	[wardId] [int] NULL,
	[zoneId] [int] NULL,
	[vehicleType] [varchar](100) NULL,
	[priority] [varchar](255) NULL,
	)
	END
GO


IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'swm' AND TABLE_NAME = 'binCollectedStatus')
	BEGIN
	CREATE TABLE [swm].[binCollectedStatus](
	[id] [int] NOT NULL primary key,
	[tripId] [int] NULL,
	[crm_id_pk] [int] NULL,
	[crmCollType] [nvarchar](50) NULL,
	[binCollectionStatusId] [int] NULL,
	[ward] [nvarchar](256) NULL,
	[zone] [nvarchar](256) NULL,
	[tripScheduledDate] [datetime] NULL,
	[binonRoadStatus] [int] NULL,
	[routeName] [varchar](256) NULL,
	[address] [varchar](256) NULL,
	[binName] [nvarchar](100) NULL,
	[personName] [varchar](100) NULL,
	[binCollectionStatusName] [varchar](50) NULL,
	[binCollectedTime] [datetime] NULL,
	[houseNumber] [varchar](255) NULL,
	[tenantCode] [varchar](150) NULL,
	[vehicleNumber] [nvarchar](150) NULL,
	)
	END
GO


-------------------------------------------------------FireEngineEventDetails---------------------------------------------------------

IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'safety' AND TABLE_NAME = 'fireEngineEventDetails')
	BEGIN
CREATE TABLE [safety].[fireEngineEventDetails](
	[Id] [varchar](250) NOT NULL primary key,
	[name] [varchar](250) NULL,
	[availability] [varchar](250) NULL,
	[equipmentAvailabilityInPercentage] [varchar](250) NULL,
	[fuelLevelInPercentage] [varchar](250) NULL,
	[foamLevelInPercentage] [varchar](250) NULL,
	[fireStationId] [varchar](250) NULL,
	[waterLevelInPercentage] [varchar](250) NULL,
	[eventId] [varchar](250) NULL,
	)
	END
GO
-----------------------------------------------------------------------------fireStationEventDetails----------------------------------

IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'safety' AND TABLE_NAME = 'fireStationEventDetails')
	BEGIN
CREATE TABLE [safety].[fireStationEventDetails](
	[Id] [varchar](250) NOT NULL primary key,
	[fireStationName] [varchar](250) NULL,
	[foamLevel] [varchar](250) NULL,
	[waterLevel] [varchar](250) NULL,
	[equipmentLevel] [varchar](250) NULL,
	[stationReadiness] [varchar](250) NULL,
	[staffReadiness] [varchar](250) NULL,
	[vehicleReadiness] [varchar](250) NULL,
	[fuelLevel] [varchar](250) NULL,
	[rating] [varchar](250) NULL,
	[comment] [varchar](250) NULL,
	[eventId] [varchar](250) NULL,
	)
	END
GO
-----------------------------------------------------------------------fireResourceEventDetails-----------------------------------------
IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'safety' AND TABLE_NAME = 'fireResourceEventDetails')
	BEGIN
CREATE TABLE [safety].[fireResourceEventDetails](
	[Id] [varchar](250) NOT NULL primary key,
	[resourceId] [varchar](250) NULL,
	[training] [varchar](250) NULL,
	[attendance] [varchar](250) NULL,
	[workforceUserId] [varchar](250) NULL,
	[fitness] [varchar](250) NULL,
	[name] [varchar](250) NULL,
	[fireStationId] [varchar](250) NULL,
	[skillset] [varchar](250) NULL,
	[eventId] [varchar](250) NULL,
	)
	END
GO

-----------------------------------------------------------------------fireEquipmentEventDetails-----------------------------------------
IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'safety' AND TABLE_NAME = 'fireEquipmentEventDetails')
	BEGIN
CREATE TABLE [safety].[fireEquipmentEventDetails](
	[Id] [varchar](250) NOT NULL primary key,
	[name] [varchar](250) NULL,
	[availability] [varchar](250) NULL,
	[equipmentType] [varchar](1000) NULL,
	[equipmentId] [varchar](250) NULL,
	[eventId] [varchar](250) NULL,
	)
	END
GO
-----------------------------------------------------fireEventDetails---------------------------------------------------------------------
IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'safety' AND TABLE_NAME = 'fireEventDetails')
	BEGIN
CREATE TABLE [safety].[fireEventDetails](
	[Id] [int] NOT NULL primary key,
	[eventId] [nvarchar](500) NULL,
	[eventExcutionStage] [nvarchar](500) NULL,
	[exicutionTime] [datetime] NULL,
	[type] [nvarchar](255) NULL,
	[data] [varchar](max) NULL,
	)
	END
GO

-------------------------------------------------------[ewds].[situationDetails]---------------------------------------------------------------
IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'ewds' AND TABLE_NAME = 'situationDetails')
	BEGIN
CREATE TABLE [ewds].[situationDetails](
	[id] [nvarchar](100) NOT NULL primary key,
	[situationId] [varchar](50) NULL,
	[situationDescription] [nvarchar](500) NULL,
	[situationStage] [int] NULL,
	[sourceType] [varchar](150) NULL,
	[eventId] [varchar](150) NULL,
	[predictionType] [bit] NULL,
	[forecastTime] [datetime] NULL,
	[situationCreatedDate] [datetime] NULL,
	[situationStatus] [int] NULL,
	[situationMasterId] [int] NULL,
	[sopId] [int] NULL,
	[categoryName] [varchar](100) NULL,
	[companyId] [int] NULL,
	[companyCode] [varchar](100) NULL,
	[priority] [varchar](50) NULL,
	[lsg] [varchar](100) NULL,
	[alarmName] [varchar](150) NULL,
	[incidentTimeToComplete] [int] NULL,
	[taluk] [varchar](100) NULL,
	[jurisdictionName] [varchar](100) NULL,
	[alarmId] [int] NULL,
	[situationClosingTimeInMins] [int] NULL,
	[incidentCount] [int] NULL,
	[latitude] [float] NULL,
	[longitude] [float] NULL,
	[priorityColor] [varchar](50) NULL,
	[userName] [varchar](50) NULL,
	)
	END
GO


-------------------------------------------------------[ewds].[eventDetails]---------------------------------------------------------------

IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'ewds' AND TABLE_NAME = 'eventDetails')
	BEGIN
CREATE TABLE [ewds].[eventDetails](
	[id] [nvarchar](100) NOT NULL primary key,
	[eventId] [varchar](50) NULL,
	[eventCreatedTime] [datetime] NULL,
	[eventAddress] [nvarchar](500) NULL,
	[eventDescription] [nvarchar](500) NULL,
	[operatorName] [varchar](150) NULL,
	[phoneNumber] [varchar](50) NULL,
	[emailId] [nvarchar](500) NULL,
	[sourceType] [int] NULL,
	[categoryName] [varchar](100) NULL,
	[latitude] [float] NULL,
	[longitude] [float] NULL,
	[lsg] [varchar](150) NULL,
	[taluk] [varchar](150) NULL,
	[district] [varchar](150) NULL,
	[eventStatus] [varchar](50) NULL,
	[companyCode] [varchar](50) NULL,
	[companyId] [int] NULL,
	[alarmName] [varchar](100) NULL,
	[priority] [varchar](50) NULL,
	[situationId] [int] NULL,
	[priorityColor] [varchar](50) NULL,
	[ApplicationName] [varchar](50) NULL,
	)
	END
GO


-------------------------------------------------------[ewds].[alarmDetails]---------------------------------------------------------------
IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'ewds' AND TABLE_NAME = 'alarmDetails')
	BEGIN
CREATE TABLE [ewds].[alarmDetails](
	[id] [nvarchar](250) NOT NULL primary key,
	[alarmId] [int] NULL,
	[companyCode] [varchar](200) NULL,
	[alarmName] [nvarchar](250) NULL,
	[alertTypeCode] [int] NULL,
	[priorityName] [varchar](30) NULL,
	[componentId] [int] NULL,
	[eventId] [nvarchar](50) NULL,
	[latitude] [float] NULL,
	[longitude] [float] NULL,
	[lsg] [nvarchar](500) NULL,
	[taluk] [nvarchar](500) NULL,
	[categoryName] [nvarchar](100) NULL,
	[district] [nvarchar](500) NULL,
	[companyId] [int] NULL,
	[alarmGeneratedTime] [datetime] NULL,
	[alarmStatusId] [int] NULL,
	[alarmStatus] [nvarchar](100) NULL,
	[transactionSopId] [int] NULL,
	[approvalStatus] [int] NULL,
	[createdBy] [varchar](255) NULL,
	[roleStatus] [nvarchar](200) NULL,
	[sourceType] [varchar](100) NULL,
	[weatherType] [nvarchar](200) NULL,
	[alertParentId] [int] NULL,
	[alertGroupStatus] [int] NULL,
	[priorityColor] [varchar](50) NULL,
	)
	END
GO
-------------------------------------------------------[ewds].[hospitalDetails]---------------------------------------------------------------
IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'ewds' AND TABLE_NAME = 'hospitalDetails')
	BEGIN
CREATE TABLE [ewds].[hospitalDetails](
	[id] [int] NOT NULL primary key,
	[name] [varchar](250) NULL,
	[latitude] [float] NULL,
	[longitude] [float] NULL,
	[category] [varchar](100) NULL,
	[address] [nvarchar](400) NULL,
	[phoneNumber] [varchar](100) NULL,
	[timings] [varchar](100) NULL,
	[district] [varchar](100) NULL,
	[taluk] [varchar](100) NULL,
	[lsg] [varchar](100) NULL,
	[noofBeds] [int] NULL,
	[noofRooms] [int] NULL,
	)
	END
GO

-------------------------------------------------------[ewds].[hotelDetails]---------------------------------------------------------------

IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'ewds' AND TABLE_NAME = 'hotelDetails')
	BEGIN
CREATE TABLE [ewds].[hotelDetails](
	[id] [int] NOT NULL primary key,
	[name] [varchar](250) NULL,
	[latitude] [float] NULL,
	[longitude] [float] NULL,
	[category] [varchar](100) NULL,
	[address] [nvarchar](400) NULL,
	[phoneNumber] [varchar](100) NULL,
	[timings] [varchar](100) NULL,
	[district] [varchar](100) NULL,
	[taluk] [varchar](100) NULL,
	[lsg] [varchar](100) NULL,
	)
	END
GO

-------------------------------------------------------[ewds].[policeStationDetails]---------------------------------------------------------------

IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'ewds' AND TABLE_NAME = 'policeStationDetails')
	BEGIN
CREATE TABLE [ewds].[policeStationDetails](
	[id] [int] NOT NULL primary key,
	[name] [varchar](250) NULL,
	[latitude] [float] NULL,
	[longitude] [float] NULL,
	[category] [varchar](100) NULL,
	[address] [nvarchar](400) NULL,
	[phoneNumber] [varchar](100) NULL,
	[timings] [varchar](100) NULL,
	[district] [varchar](100) NULL,
	[taluk] [varchar](100) NULL,
	[lsg] [varchar](100) NULL,
	)
	END
GO


-------------------------------------------------------[ewds].[policeStationDetails]---------------------------------------------------------------

IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'ewds' AND TABLE_NAME = 'citizenDetails')
	BEGIN
CREATE TABLE [ewds].[citizenDetails](
	[id] [int] NOT NULL primary key,
	[category] [varchar](50) NULL,
	[count] [int] NULL,
	)
	END
GO
--------------------------------------------------------------------------------------------------------------------------------------------------------------

IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'iot' AND TABLE_NAME = 'eventLogDetails')
	BEGIN
CREATE TABLE [iot].[eventLogDetails](
	[Id] [int] NOT NULL primary key,
	[eventId] [nvarchar](500) NULL,
	[eventExcutionStage] [nvarchar](500) NULL,
	[exicutionTime] [datetime] NULL,
	[type] [nvarchar](255) NULL,
	[data] [varchar](max) NULL,
	)
	END
GO
-------------------------------------------------------------------------------------------------------------------------------------------------------

-----------------------------------------------   controllerDetails         -----------------------------------------------------------
IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'water' AND TABLE_NAME = 'controllerDetails')
	BEGIN

CREATE TABLE [water].[controllerDetails](
	[pk_controllerId] [nvarchar] (255) NOT NULL PRIMARY KEY,
	[controllerId] int null,
	[name] [nvarchar](255) NULL,
	[uuid] [nvarchar](255) NULL,
	[address] [nvarchar](255) NULL,
	[profileId] [nvarchar](255) NULL,
	[categoryName] [nvarchar](255) NULL,
	[gatewayTypeId] [nvarchar](255) NULL,
	[status] [nvarchar](255) NULL,
	[operationalStatus] [nvarchar](255) NULL,
	[warranty] [nvarchar](255) NULL,
	[jurisdictionId] [nvarchar](255) NULL,
	[node_id] [int] NULL,
	[manufacturer] [nvarchar](255) NULL,
	[powerStatus] [nvarchar](255) NULL,
	[connectionType] [nvarchar](255) NULL,
	[batteryLevel] [float] NULL,
	[lastSyncTime] [datetime] NULL,
	[Longitude] [float] NULL,
	[Latitude] [float] NULL,
	[operatingMode] [nvarchar](255) NULL,
	[tenantCode] [nvarchar](30) NULL,
	)
	END
GO


-----------------------------------------------   flowMeterDetails         -----------------------------------------------------------
IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'water' AND TABLE_NAME = 'flowMeterDetails')
	BEGIN

CREATE TABLE [water].[flowMeterDetails](
    [pk_flowmeterId] [nvarchar](100) NOT NULL PRIMARY KEY,
	[PK_Controller_Id] [varchar](100)  NULL ,
	[flowMeterId] [varchar](150) NULL,
	[FlowMeter_name] [varchar](50) NULL,
	[geomType] [varchar](100) NULL,
	[Longitude] [varchar](50) NULL,
	[Latitude] [varchar](50) NULL,
	[address] [varchar](250) NULL,
	[deviceProfileId] [varchar](50) NULL,
	[categoryName] [varchar](50) NULL,
	[deviceTypeId] [varchar](50) NULL,
	[status] [varchar](50) NULL,
	[uuid] [varchar](100) NULL,
	[manufactureDate] [datetime] NULL,
	[installationDate] [datetime] NULL,
	[warranty] [nvarchar](50) NULL,
	[description] [nvarchar](150) NULL,
	[isGatewayRequired] [nvarchar](150) NULL,
	[gatewayList] [nvarchar](150) NULL,
	[assetId] [nvarchar](150) NULL,
	[health] [nvarchar](150) NULL,
	[manufacturer] [nvarchar](150) NULL,
	[flowRate] [float] NULL,
	[meterusage] [float] NULL,
	[waterQuality] [float] NULL,
	[pressure] [float] NULL,
	[timestamp] [datetime] NULL,
	[meterStatus] [nvarchar](20) NULL,
	[location] [nvarchar](20) NULL,
	[node_id] [nvarchar](20) NULL,
	[tenantCode] [nvarchar](50) NULL,
	[juridictionId] [nvarchar](20) NULL
	)
	END
GO


-----------------------------------------------   GreenSpace         -----------------------------------------------------------
IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'water' AND TABLE_NAME = 'GreenSpace')
	BEGIN

CREATE TABLE [water].[GreenSpace](
	[pk_greenSpaceId] [varchar](150) NOT NULL PRIMARY KEY,
	[name] [varchar](150) NULL,
	[greenSpaceId] [varchar](150) NULL,
	[Type] [varchar](150) NULL,
	[inchargeNumber] [varchar](150) NULL,
	[soilMoistureLevel] [float] NULL,
	[geomType] [varchar](100) NULL,
	[node_id] [varchar](150) NULL,
	[tenantCode] [nvarchar](30) NULL
	
		)
	END
GO

-----------------------------------------------   jurisdictionDetails         -----------------------------------------------------------
IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'water' AND TABLE_NAME = 'jurisdictionDetails')
	BEGIN
	
CREATE TABLE [water].[jurisdictionDetails](
	[pk_JurisdictionId] [nvarchar](250) NOT NULL PRIMARY KEY,
	[jurisdictionId] int NULL,
	[Location_name] [nvarchar](50) NULL,
	[geomType] [nvarchar](50) NULL,
	[Longitude] [nvarchar](50) NULL,
	[Latitude] [nvarchar](50) NULL,
	[address] [nvarchar](250) NULL,
	[city] [nvarchar](50) NULL,
	[country] [nvarchar](50) NULL,
	[node_id] [nvarchar](50) NULL,
	[Entity_Location_ID] [nvarchar](100) NULL,
	[unique_id] [nvarchar](50) NULL,
	[layer_data_id] [nvarchar](50) NULL,
	[tenantCode] [nvarchar](50) NULL,
			)
	END
GO

-----------------------------------------------   Location_Details         -----------------------------------------------------------

IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'water' AND TABLE_NAME = 'locationDetails')
	BEGIN
CREATE TABLE [water].[locationDetails](
	[pk_locationId] [nvarchar](50) NOT NULL PRIMARY KEY,
	[locationId] int null,
	[Location_Name] [nvarchar](100) NULL,
	[Geom_Type] [nvarchar](100) NULL,
	[Longitude] [nvarchar](50) NULL,
	[Latitude] [nvarchar](50) NULL,
	[Address] [nvarchar](250) NULL,
	[City] [nvarchar](50) NULL,
	[Country] [nvarchar](50) NULL,
	[LayerData_ID] [nvarchar](50) NULL,
	[Unique_ID] [nvarchar](100) NULL,
	[Node_Id] [nvarchar](50) NULL,
	[tenantCode] [nvarchar](100) NULL,
	
   )
	END
GO
	
	
-----------------------------------------------   irrigationqueryInfo-----------------------------------------------------

IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'ssis' AND TABLE_NAME = 'irrigationqueryInfo')
	BEGIN

CREATE TABLE [ssis].[irrigationqueryInfo](
	[tableName] [varchar](255) NOT NULL,
	[query] [nvarchar](max) NOT NULL,
	[tenantCode] [nvarchar](50) NULL
	)
	END
GO



-----------------------------------------------   smartTimerDetails         -----------------------------------------------------------

IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'water' AND TABLE_NAME = 'smartTimerDetails')
	BEGIN

CREATE TABLE [water].[smartTimerDetails](
	[PK_Valve_id] [varchar](150) NULL,
	[PK_Controller_id] [varchar](150) NULL,
	[pk_smartTimersId] [varchar](150) NOT NULL PRIMARY KEY,
	[smartTimersId] [varchar] (150) NULL,
	[name] [nvarchar](max) NULL,
	[uuid] [nvarchar](max) NULL,
	[geomType] [nvarchar](max) NULL,
	[Latitude] [float] NULL,
	[Longitude] [float] NULL,
	[address] [nvarchar](max) NULL,
	[categoryName] [nvarchar](max) NULL,
	[deviceTypeId] [nvarchar](max) NULL,
	[status] [nvarchar](max) NULL,
	[warranty] [int] NULL,
	[isGatewayRequired] [bit] NULL,
	[gatewayList] [nvarchar](max) NULL,
	[assetId] [nvarchar](max) NULL,
	[health] [nvarchar](max) NULL,
	[operatingStatus] [nvarchar](max) NULL,
	[operatingTemperature] [float] NULL,
	[timeStamp] [datetime] NULL,
	[frequency] [float] NULL,
	[node_id] [int] NULL,
	[juridictionId] [nvarchar](max) NULL,
	[scheduleType] [nvarchar](max) NULL,
	[startTime] [datetime] NULL,
	[endTime] [datetime] NULL,
	[interval] [int] NULL,
	[waterDuration] [float] NULL,
	[flowRate] [float] NULL,
	[waterVolume] [float] NULL,
	[tenantCode] [nvarchar](4) NULL
		)
	END
GO


-----------------------------------------------   soilMoistureSensorDetails         -----------------------------------------------------------


IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'water' AND TABLE_NAME = 'soilMoistureSensorDetails')
	BEGIN

CREATE TABLE [water].[soilMoistureSensorDetails](
	[PK_Controller_id] [varchar](150) NULL,
	[PK_Sprinkler_id] [varchar](150) NULL,
	[pk_soilMoistureSensorId] [varchar](150)  NOT NULL PRIMARY KEY,
	[soilMoistureSensorId] [varchar](150)  NOT NULL,
	[SoilMoisutureSonsor_name] [varchar](50) NULL,
	[geomType] [varchar](100) NULL,
	[Longitude] [varchar](50) NULL,
	[Latitude] [varchar](50) NULL,
	[address] [varchar](250) NULL,
	[deviceProfileId] [varchar](50) NULL,
	[categoryName] [varchar](50) NULL,
	[deviceTypeId] [varchar](50) NULL,
	[status] [varchar](50) NULL,
	[uuid] [varchar](100) NULL,
	[sensorStatus] [nvarchar](50) NULL,
	[manufactureDate] [datetime] NULL,
	[installationDate] [datetime] NULL,
	[warranty] [nvarchar](50) NULL,
	[description] [nvarchar](150) NULL,
	[isGatewayRequired] [nvarchar](150) NULL,
	[gatewayList] [nvarchar](150) NULL,
	[assetId] [nvarchar](150) NULL,
	[manufacturer] [nvarchar](150) NULL,
	[soilMositureStatus] [float] NULL,
	[moistureLevel] [float] NULL,
	[soilTemperature] [float] NULL,
	[salinity] [float] NULL,
	[batteryLevel] [float] NULL,
	[maxMoistureCapacity] [float] NULL,
	[waterRetentionRate] [float] NULL,
	[timestamp] [datetime] NULL,
	[sensorDepth] [float] NULL,
	[node_id] [nvarchar](20) NULL,
	[soilPH] [float] NULL,
	[juridictionId] [nvarchar](20) NULL,
	[tenantCode] [nvarchar](30) NULL,
		)
	END
GO


-----------------------------------------------   sprinklerDetails         -----------------------------------------------------------

IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'water' AND TABLE_NAME = 'sprinklerDetails')
	BEGIN


CREATE TABLE [water].[sprinklerDetails](
	[pk_sprinklerId] [varchar](150) NOT NULL PRIMARY KEY,
	[name] [nvarchar](max) NULL,
	[uuid] [nvarchar](max) NULL,
	[sprinklerId] [nvarchar](max) NULL,
	[status] [nvarchar](max) NULL,
	[flowRate] [float] NULL,
	[coverageRadius] [float] NULL,
	[pressure] [float] NULL,
	[location] [nvarchar](max) NULL,
	[connectedTo] [nvarchar](max) NULL,
	[installationDate] [datetime] NULL,
	[lastMaintenanceDate] [datetime] NULL,
	[nextMaintenanceDate] [datetime] NULL,
	[manufacturer] [nvarchar](max) NULL,
	[distance] [nvarchar](max) NULL,
	[material] [nvarchar](max) NULL,
	[isGatewayRequired] [bit] NULL,
	[gatewayList] [nvarchar](max) NULL,
	[node_id] [int] NULL,
	[SprayPattern] [nvarchar](max) NULL,
	[tenantCode] [nvarchar](30) NULL
	
			)
	END
GO

-----------------------------------------------   valveDetails         -----------------------------------------------------------

IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'water' AND TABLE_NAME = 'valveDetails')
	BEGIN



CREATE TABLE [water].[valveDetails](
	[pk_valveId] [nvarchar](150) NOT NULL PRIMARY KEY,

	[name] [nvarchar](max) NULL,
	[uuid] [nvarchar](max) NULL,
	[geomType] [nvarchar](max) NULL,
	[coordinates] [nvarchar](max) NULL,
	[address] [nvarchar](max) NULL,
	[deviceProfileId] [nvarchar](max) NULL,
	[categoryName] [nvarchar](max) NULL,
	[deviceTypeId] [nvarchar](max) NULL,
	[status] [nvarchar](max) NULL,
	[operationalStatus] [nvarchar](max) NULL,
	[installationDate] [datetime] NULL,
	[warranty] [nvarchar](max) NULL,
	[description] [nvarchar](max) NULL,
	[isGatewayRequired] [bit] NULL,
	[gatewayList] [nvarchar](max) NULL,
	[assetId] [nvarchar](max) NULL,
	[health] [nvarchar](max) NULL,
	[valveId] [int] NULL,
	[valveName] [nvarchar](max) NULL,
	[valveType] [nvarchar](max) NULL,
	[location] [nvarchar](max) NULL,
	[pressureRating] [float] NULL,
	[flowCapacity] [float] NULL,
	[diameter] [float] NULL,
	[controlSystem] [nvarchar](max) NULL,
	[materialCompatibility] [nvarchar](max) NULL,
	[valveSize] [float] NULL,
	[valveMeter] [int] NULL,
	[valveMeterReading] [float] NULL,
	[manufacturer] [nvarchar](max) NULL,
	[flowrate] [float] NULL,
	[inletPressure] [float] NULL,
	[outletPressure] [float] NULL,
	[temperature] [float] NULL,
	[density] [float] NULL,
	[viscosity] [float] NULL,
	[size] [float] NULL,
	[position] [nvarchar](max) NULL,
	[range] [float] NULL,
	[flowDirection] [nvarchar](max) NULL,
	[lastMaintenanceDate] [datetime] NULL,
	[isoStandards] [nvarchar](max) NULL,
	[node_id] [int] NULL,
	[material] [nvarchar](max) NULL,
	[juridictionId] [nvarchar](max) NULL,
	[tenantCode] [nvarchar](30) NULL
	
		
			)
	END
GO


-----------------------------------------------   Zone         -----------------------------------------------------------

IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'water' AND TABLE_NAME = 'Zone')
	BEGIN


CREATE TABLE [water].[Zone](
	[controller_id] [nvarchar](150)  NULL ,
	[pk_zoneId] [nvarchar](150) NOT NULL PRIMARY KEY,
	[name] [nvarchar](max) NULL,
	[zoneId] [bigint] NULL,
	[coordinates] [nvarchar](max) NULL,
	[address] [nvarchar](max) NULL,
	[zoneInchargeName] [nvarchar](max) NULL,
	[zoneInchargeNumber] [nvarchar](max) NULL,
	[areaSizeInMeters] [int] NULL,
	[cropType] [nvarchar](max) NULL,
	[soilType] [nvarchar](max) NULL,
	[irrigationMethod] [nvarchar](max) NULL,
	[targetSoilMoisture] [float] NULL,
	[currentSoilMoisture] [float] NULL,
	[soilPH] [float] NULL,
	[waterNeedIndex] [float] NULL,
	[vegetationIndex] [float] NULL,
	[irrigationSchedule] [datetime] NULL,
	[irrigationDurationInMinutes] [int] NULL,
	[irrigationStatus] [nvarchar](max) NULL,
	[lastIrrigationDate] [datetime] NULL,
	[nextIrrigationDate] [datetime] NULL,
	[node_id] [int] NULL,
	[tenantCode] [nvarchar](30) NULL
	
				)
	END
GO



-----------------------------------------------------------------------Water Tables-----------------------------------------
IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'water' AND TABLE_NAME = 'districtCoolingPlant')
	BEGIN
CREATE TABLE [water].[districtCoolingPlant](
	[pk_districtCoolingPlantId]  [nvarchar](150) NOT NULL PRIMARY KEY,
	[name] [nvarchar](max) NULL,
	[coordinates] [nvarchar](max) NULL,
	[capacity] [float] NULL,
	[serviceArea] [nvarchar](max) NULL,
	[setPointTemperature] [float] NULL,
	[actualTemperature] [float] NULL,
	[temperatureRange] [nvarchar](max) NULL,
	[operationalStatus] [nvarchar](max) NULL,
	[inLetTemperature] [float] NULL,
	[outLetTemperature] [float] NULL,
	[powerStatus] [nvarchar](max) NULL,
	[waterLevels] [float] NULL,
	[node_id] [int] NULL,
	[jurisdictionId] [nvarchar](max) NULL,
	[districtCoolingPlantId] [bigint] NULL,
	[tenantCode] [nvarchar](50)  NULL 
    )
    END 
GO





IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'water' AND TABLE_NAME = 'flowSensorDetails')
	BEGIN
CREATE TABLE [water].[flowSensorDetails](
	[pk_flowSensorId] [nvarchar](101) NOT NULL PRIMARY KEY,
	[PK_District_cooling_plant_id] [bigint] NULL,
	[name] [nvarchar](max) NULL,
	[uuid] [nvarchar](max) NULL,
	[dimension] [nvarchar](max) NULL,
	[geomType] [nvarchar](max) NULL,
	[coordinates] [nvarchar](max) NULL,
	[address] [nvarchar](max) NULL,
	[deviceProfileId] [nvarchar](max) NULL,
	[categoryName] [nvarchar](max) NULL,
	[deviceTypeId] [nvarchar](max) NULL,
	[status] [nvarchar](max) NULL,
	[operationalStatus] [nvarchar](max) NULL,
	[manufactureDate] [datetime] NULL,
	[installationDate] [datetime] NULL,
	[warranty] [int] NULL,
	[description] [nvarchar](max) NULL,
	[assetId] [nvarchar](max) NULL,
	[node_id] [int] NULL,
	[timestamp] [datetime] NULL,
	[value] [float] NULL,
	[flowRate] [float] NULL,
	[flowDirection] [nvarchar](max) NULL,
	[maxFlowCapacity] [float] NULL,
	[minFlowThreshold] [float] NULL,
	[pressureRange] [nvarchar](max) NULL,
	[temperatureRange] [nvarchar](max) NULL,
	[sensorOutputType] [nvarchar](max) NULL,
	[networkStatus] [nvarchar](max) NULL,
	[jurisdictionId] [nvarchar](max) NULL,
	[flowSensorId] [bigint] NOT NULL ,
	[tenantCode] [nvarchar](50) NULL)
	END 
	GO
	
	
IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'water' AND TABLE_NAME = 'junctionDetails')
	BEGIN
	CREATE TABLE [water].[junctionDetails](
	[PK_Pipe_id] [bigint] NULL,
	[Junction_id] [bigint] NULL,
	[name] [nvarchar](max) NULL,
	[node_id] [int] NULL,
	[coordinates] [nvarchar](max) NULL,
	[address] [nvarchar](max) NULL,
	[flowRate] [float] NULL,
	[pressure] [float] NULL,
	[valveStatus] [bit] NULL,
	[pressureReliefMechanism] [bit] NULL,
	[jurisdictionId] [nvarchar](max) NULL,
	[category] [nvarchar](max) NULL,
	[tenantCode] [nvarchar](50) NULL,
	[PK_ID] [nvarchar](101) NOT NULL PRIMARY KEY
	)
	END 
	GO
	
IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'water' AND TABLE_NAME = 'leakDetectionSensor')
	BEGIN
	CREATE TABLE [water].[leakDetectionSensor](
	[PK_Leak_Detection_Sensor_id] [bigint] NULL,
	[PK_Pipe_id] [bigint] NULL,
	[name] [nvarchar](max) NULL,
	[uuid] [nvarchar](max) NULL,
	[coordinates] [nvarchar](max) NULL,
	[address] [nvarchar](max) NULL,
	[deviceProfileId] [nvarchar](max) NULL,
	[categoryName] [nvarchar](max) NULL,
	[deviceTypeId] [nvarchar](max) NULL,
	[status] [nvarchar](max) NULL,
	[operationalStatus] [nvarchar](max) NULL,
	[manufactureDate] [datetime] NULL,
	[installationDate] [datetime] NULL,
	[warranty] [int] NULL,
	[description] [nvarchar](max) NULL,
	[assetId] [nvarchar](max) NULL,
	[node_id] [int] NULL,
	[timestamp] [datetime] NULL,
	[value] [float] NULL,
	[leakLocation] [nvarchar](max) NULL,
	[leakSize] [float] NULL,
	[pressureLevel] [float] NULL,
	[temperature] [float] NULL,
	[humidity] [float] NULL,
	[sensitivity] [float] NULL,
	[maintenanceInterval] [nvarchar](max) NULL,
	[lastMaintenanceDate] [datetime] NULL,
	[leakDetectionRange] [float] NULL,
	[sensitivityLevel] [float] NULL,
	[responseTime] [float] NULL,
	[overpressureRating] [float] NULL,
	[operatingTemperature] [float] NULL,
	[jurisdictionId] [nvarchar](max) NULL,
	[flowRate] [float] NULL,
	[PK_ID] [nvarchar](101) NOT NULL PRIMARY KEY,
	[tenantCode] [nvarchar](50) NULL)
	END 
	GO 
	
	
	
	
IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'water' AND TABLE_NAME = 'pipeDetails')
	BEGIN
CREATE TABLE [water].[pipeDetails](
	[PK_Pipe_id] [bigint] NULL,
	[PK_Tanks_id] [bigint] NULL,
	[name] [nvarchar](max) NULL,
	[pipeId] [nvarchar](max) NULL,
	[coordinates] [nvarchar](max) NULL,
	[length] [float] NULL,
	[diameter] [float] NULL,
	[material] [nvarchar](max) NULL,
	[roughness] [nvarchar](max) NULL,
	[condition] [nvarchar](max) NULL,
	[categoryName] [nvarchar](max) NULL,
	[typeSize] [float] NULL,
	[node_id] [int] NULL,
	[PK_ID] [nvarchar](101) NOT NULL PRIMARY KEY,
	[tenantCode] [nvarchar](50) NULL
	)
	END 
	GO
	
	
IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'water' AND TABLE_NAME = 'pressureSensor')
	BEGIN
CREATE TABLE [water].[pressureSensor](
	[PK_Pressure_Sensor_id] [bigint] NULL,
	[PK_District_cooling_plant_id] [bigint] NULL,
	[name] [nvarchar](max) NULL,
	[uuid] [nvarchar](max) NULL,
	[coordinates] [nvarchar](max) NULL,
	[address] [nvarchar](max) NULL,
	[deviceProfileId] [nvarchar](max) NULL,
	[categoryName] [nvarchar](max) NULL,
	[deviceTypeId] [nvarchar](max) NULL,
	[status] [nvarchar](max) NULL,
	[operationalStatus] [nvarchar](max) NULL,
	[manufactureDate] [datetime] NULL,
	[installationDate] [datetime] NULL,
	[warranty] [int] NULL,
	[description] [nvarchar](max) NULL,
	[assetId] [nvarchar](max) NULL,
	[node_id] [int] NULL,
	[timestamp] [datetime] NULL,
	[value] [float] NULL,
	[pressureRange] [nvarchar](max) NULL,
	[sensorAccuracy] [float] NULL,
	[minPressure] [float] NULL,
	[maxPressure] [float] NULL,
	[lastMaintenanceDate] [datetime] NULL,
	[batteryStatus] [nvarchar](max) NULL,
	[powerConsumption] [float] NULL,
	[sensorModel] [nvarchar](max) NULL,
	[overpressureRating] [float] NULL,
	[jurisdictionId] [nvarchar](max) NULL,
	[PK_ID] [nvarchar](101) NOT NULL PRIMARY KEY,
	[tenantCode] [nvarchar](50) NULL
	)
	END 
	GO 
	
	
	
IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'water' AND TABLE_NAME = 'reservoirDetails')
	BEGIN
	CREATE TABLE [water].[reservoirDetails](
	[PK_Reservoir_id] [bigint] NULL,
	[name] [nvarchar](max) NULL,
	[coordinates] [nvarchar](max) NULL,
	[capacity] [float] NULL,
	[infrastructureStatus] [nvarchar](max) NULL,
	[lastInspectionDate] [datetime] NULL,
	[waterLevels] [float] NULL,
	[waterQualityMetrics] [nvarchar](max) NULL,
	[node_id] [int] NULL,
	[reservoirId] [nvarchar](max) NULL,
	[reservoirType] [nvarchar](max) NULL,
	[PK_ID] [nvarchar](101) NOT NULL PRIMARY KEY,
	[tenantCode] [nvarchar](30) NULL
	)
	END 
	GO
	
	
IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'water' AND TABLE_NAME = 'smartBulkMeters')
	BEGIN
CREATE TABLE [water].[smartBulkMeters](
	[PK_Smart_Bulk_Meters_id] [bigint] NULL,
	[name] [nvarchar](max) NULL,
	[uuid] [nvarchar](max) NULL,
	[coordinates] [nvarchar](max) NULL,
	[address] [nvarchar](max) NULL,
	[deviceProfileId] [nvarchar](max) NULL,
	[categoryName] [nvarchar](max) NULL,
	[deviceTypeId] [nvarchar](max) NULL,
	[status] [nvarchar](max) NULL,
	[operationalStatus] [nvarchar](max) NULL,
	[manufactureDate] [datetime] NULL,
	[installationDate] [datetime] NULL,
	[description] [nvarchar](max) NULL,
	[assetId] [nvarchar](max) NULL,
	[node_id] [int] NULL,
	[meterType] [nvarchar](max) NULL,
	[meterSize] [float] NULL,
	[flowRate] [float] NULL,
	[waterQuality] [nvarchar](max) NULL,
	[pressureRating] [float] NULL,
	[reading] [float] NULL,
	[lastReadingTime] [datetime] NULL,
	[meterModel] [nvarchar](max) NULL,
	[jurisdictionId] [nvarchar](max) NULL,
	[manufacturer] [nvarchar](max) NULL,
	[PK_Water_Treatment_Plant_id] [varchar](150) NULL,
	[PK_Pipe_id] [varchar](150) NULL,
	[PK_ID] [nvarchar](101) NOT NULL PRIMARY KEY,
	[tenantCode] [nvarchar](50) NULL
)
END 
GO


	
IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'water' AND TABLE_NAME = 'tankDetails')
	BEGIN
	CREATE TABLE [water].[tankDetails](
	[PK_Tanks_id] [bigint] NULL,
	[name] [nvarchar](max) NULL,
	[tankId] [int] NULL,
	[tankName] [nvarchar](max) NULL,
	[tankType] [nvarchar](max) NULL,
	[coordinates] [nvarchar](max) NULL,
	[capacity] [float] NULL,
	[currentWaterLevel] [float] NULL,
	[tankHeight] [float] NULL,
	[operationalStatus] [nvarchar](max) NULL,
	[node_id] [int] NULL,
	[jurisdictionId] [nvarchar](max) NULL,
	[PK_District_cooling_plant_id] [varchar](100) NULL,
	[PK_ID] [nvarchar](101) NOT NULL PRIMARY KEY,
	[tenantCode] [nvarchar](50) NULL
	)
	END 
	GO 
	
	
	
IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'water' AND TABLE_NAME = 'waterLevelSensor')
	BEGIN
	CREATE TABLE [water].[waterLevelSensor](
	[PK_Water_level_sensor_id] [bigint] NULL,
	[name] [nvarchar](max) NULL,
	[uuid] [nvarchar](max) NULL,
	[coordinates] [nvarchar](max) NULL,
	[address] [nvarchar](max) NULL,
	[deviceProfileId] [nvarchar](max) NULL,
	[categoryName] [nvarchar](max) NULL,
	[deviceTypeId] [nvarchar](max) NULL,
	[status] [nvarchar](max) NULL,
	[operationalStatus] [nvarchar](max) NULL,
	[manufactureDate] [datetime] NULL,
	[installationDate] [datetime] NULL,
	[warranty] [int] NULL,
	[description] [nvarchar](max) NULL,
	[assetId] [nvarchar](max) NULL,
	[node_id] [int] NULL,
	[waterLevel] [float] NULL,
	[responseTime] [float] NULL,
	[overpressureRating] [float] NULL,
	[jurisdictionId] [nvarchar](max) NULL,
	[PK_Water_Treatment_Plant_id] [bigint] NULL,
	[tenantCode] [nvarchar](50) NULL,
	[PK_ID] [nvarchar](101) NOT NULL PRIMARY key
	)
	END 
	GO 
	
	
	
	
IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'water' AND TABLE_NAME = 'waterQualitySensor')
	BEGIN
CREATE TABLE [water].[waterQualitySensor](
	[PK_Water_Treatment_Plant_id] [bigint] NULL,
	[PK_Water_quality_sensor_id] [bigint] NULL,
	[name] [nvarchar](max) NULL,
	[uuid] [nvarchar](max) NULL,
	[coordinates] [nvarchar](max) NULL,
	[address] [nvarchar](max) NULL,
	[deviceProfileId] [nvarchar](max) NULL,
	[categoryName] [nvarchar](max) NULL,
	[deviceTypeId] [nvarchar](max) NULL,
	[status] [nvarchar](max) NULL,
	[operationalStatus] [nvarchar](max) NULL,
	[manufactureDate] [datetime] NULL,
	[installationDate] [datetime] NULL,
	[warranty] [int] NULL,
	[description] [nvarchar](max) NULL,
	[assetId] [nvarchar](max) NULL,
	[node_id] [int] NULL,
	[overpressureRating] [float] NULL,
	[jurisdictionId] [nvarchar](max) NULL,
	[value] [float] NULL,
	[phLevel] [float] NULL,
	[temperature] [float] NULL,
	[conductivity] [float] NULL,
	[salinity] [float] NULL,
	[dissolvedOxygen] [float] NULL,
	[chlorineLevel] [float] NULL,
	[maintenanceInterval] [nvarchar](max) NULL,
	[lastMaintenanceDate] [datetime] NULL,
	[powerConsumption] [nvarchar](max) NULL,
	[PK_ID] [nvarchar](101) NOT NULL PRIMARY KEY,
	[tenantCode] [nvarchar](50) NULL
	)
	END 
	GO
	
	
IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'water' AND TABLE_NAME = 'waterTreatmentPlant')
	BEGIN
CREATE TABLE [water].[waterTreatmentPlant](
	[PK_Water_Treatment_Plant_id] [bigint] NULL,
	[name] [nvarchar](max) NULL,
	[waterPlantId] [nvarchar](max) NULL,
	[coordinates] [nvarchar](max) NULL,
	[address] [nvarchar](max) NULL,
	[capacity] [float] NULL,
	[currentOutput] [float] NULL,
	[flowRates] [nvarchar](max) NULL,
	[treatmentProcesses] [nvarchar](max) NULL,
	[node_id] [int] NULL,
	[outputWaterQuality] [nvarchar](max) NULL,
	[lastInspectionDate] [datetime] NULL,
	[powerConsumption] [float] NULL,
	[emergencyContactNumber] [nvarchar](max) NULL,
	[totalWaterTreated] [float] NULL,
	[waterLevels] [float] NULL,
	[operationalStatus] [nvarchar](max) NULL,
	[jurisdictionId] [nvarchar](max) NULL,
	[PK_Reservoir_id] [varchar](100) NULL,
	[PK_District_cooling_plant_id] [varchar](100) NULL,
	[PK_ID] [nvarchar](101) NOT NULL PRIMARY KEY,
	[tenantCode] [nvarchar](50) NULL
	)
	END 
	GO

IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'water' AND TABLE_NAME = 'smartSubMeterDetails')
	BEGIN
	
	CREATE TABLE [water].[smartSubMeterDetails](
	[name] [nvarchar](max) NULL,
	[uuid] [nvarchar](max) NULL,
	[coordinates] [nvarchar](max) NULL,
	[address] [nvarchar](max) NULL,
	[deviceProfileId] [nvarchar](max) NULL,
	[categoryName] [nvarchar](max) NULL,
	[deviceTypeId] [nvarchar](max) NULL,
	[status] [nvarchar](max) NULL,
	[operationalStatus] [nvarchar](max) NULL,
	[manufactureDate] [datetime] NULL,
	[installationDate] [datetime] NULL,
	[description] [nvarchar](max) NULL,
	[assetId] [nvarchar](max) NULL,
	[node_id] [int] NULL,
	[meterType] [nvarchar](max) NULL,
	[flowRate] [float] NULL,
	[meterModel] [nvarchar](max) NULL,
	[jurisdictionId] [nvarchar](max) NULL,
	[smartSubMetersId] [bigint] NULL,
	[tenantCode] [nvarchar](50) NULL,
	[pk_smartSubMetersId] [nvarchar](101) NOT NULL
	)
	END 
	GO



IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'water' AND TABLE_NAME = 'pumpDetails')
	BEGIN
CREATE TABLE [water].[pumpDetails](
	[pumpId] [bigint] NULL,
	[name] [nvarchar](max) NULL,
	[uuid] [nvarchar](max) NULL,
	[geomType] [nvarchar](max) NULL,
	[coordinates] [nvarchar](max) NULL,
	[address] [nvarchar](max) NULL,
	[fileurl] [nvarchar](max) NULL,
	[fileurl_file_uuid] [nvarchar](100) NULL,
	[modelurl] [nvarchar](max) NULL,
	[modelurl_file_uuid] [nvarchar](100) NULL,
	[deviceProfileId] [nvarchar](max) NULL,
	[categoryName] [nvarchar](max) NULL,
	[deviceTypeId] [nvarchar](max) NULL,
	[status] [nvarchar](max) NULL,
	[operationalStatus] [nvarchar](max) NULL,
	[manufactureDate] [datetime] NULL,
	[installationDate] [datetime] NULL,
	[warranty] [nvarchar](max) NULL,
	[description] [nvarchar](max) NULL,
	[assetId] [nvarchar](max) NULL,
	[capacity] [float] NULL,
	[flowRate] [float] NULL,
	[pressure] [float] NULL,
	[powerConsumption] [float] NULL,
	[lastMaintenanceDate] [datetime] NULL,
	[dimension] [nvarchar](max) NULL,
	[node_id] [int] NULL,
	[pumpType] [nvarchar](max) NULL,
	[temperature] [float] NULL,
	[lubricantLevel] [float] NULL,
	[speed] [float] NULL,
	[motorType] [nvarchar](max) NULL,
	[pumpStatus] [nvarchar](max) NULL,
	[velocity] [float] NULL,
	[jurisdictionId] [nvarchar](max) NULL,
	[location] [nvarchar](max) NULL,
	[Pk_PumpId] [nvarchar](200) NOT NULL PRIMARY KEY,
	[tenantCode] [nvarchar](50) NULL
)
	END 
	GO
	
------------------------------------------------------------------------------------------------------------------------------------------------------
IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'water' AND TABLE_NAME = 'soilMoistureSensorDetails')
	BEGIN
 CREATE TABLE [water].[soilMoistureSensorDetails](
	[PK_Controller_id] [varchar](150) NULL,
	[PK_Sprinkler_id] [varchar](150) NULL,
	[pk_soilMoistureSensorId] [varchar](150) NOT NULL primary key,
	[soilMoistureSensorId] [varchar](150) NOT NULL,
	[SoilMoisutureSonsor_name] [varchar](50) NULL,
	[geomType] [varchar](100) NULL,
	[Longitude] [varchar](50) NULL,
	[Latitude] [varchar](50) NULL,
	[address] [varchar](250) NULL,
	[deviceProfileId] [varchar](50) NULL,
	[categoryName] [varchar](50) NULL,
	[deviceTypeId] [varchar](50) NULL,
	[status] [varchar](50) NULL,
	[uuid] [varchar](100) NULL,
	[sensorStatus] [nvarchar](50) NULL,
	[manufactureDate] [datetime] NULL,
	[installationDate] [datetime] NULL,
	[warranty] [nvarchar](50) NULL,
	[description] [nvarchar](150) NULL,
	[isGatewayRequired] [nvarchar](150) NULL,
	[gatewayList] [nvarchar](150) NULL,
	[assetId] [nvarchar](150) NULL,
	[manufacturer] [nvarchar](150) NULL,
	[soilMositureStatus] [float] NULL,
	[moistureLevel] [float] NULL,
	[soilTemperature] [float] NULL,
	[salinity] [float] NULL,
	[batteryLevel] [float] NULL,
	[maxMoistureCapacity] [float] NULL,
	[waterRetentionRate] [float] NULL,
	[timestamp] [datetime] NULL,
	[sensorDepth] [float] NULL,
	[node_id] [nvarchar](20) NULL,
	[soilPH] [float] NULL,
	[juridictionId] [nvarchar](20) NULL,
	[tenantCode] [nvarchar](30) NULL
	)END 
	GO
--------------------------------------------------------------------------------------------------------------------------------------------------------
IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'water' AND TABLE_NAME = 'Zone')
	BEGIN
	CREATE TABLE [water].[Zone](
	[controller_id] [nvarchar](150) NULL,
	[pk_zoneId] [nvarchar](150) NOT NULL primary key,
	[name] [nvarchar](max) NULL,
	[zoneId] [bigint] NULL,
	[coordinates] [nvarchar](max) NULL,
	[address] [nvarchar](max) NULL,
	[zoneInchargeName] [nvarchar](max) NULL,
	[zoneInchargeNumber] [nvarchar](max) NULL,
	[areaSizeInMeters] [int] NULL,
	[cropType] [nvarchar](max) NULL,
	[soilType] [nvarchar](max) NULL,
	[irrigationMethod] [nvarchar](max) NULL,
	[targetSoilMoisture] [float] NULL,
	[currentSoilMoisture] [float] NULL,
	[soilPH] [float] NULL,
	[waterNeedIndex] [float] NULL,
	[vegetationIndex] [float] NULL,
	[irrigationSchedule] [datetime] NULL,
	[irrigationDurationInMinutes] [int] NULL,
	[irrigationStatus] [nvarchar](max) NULL,
	[lastIrrigationDate] [datetime] NULL,
	[nextIrrigationDate] [datetime] NULL,
	[node_id] [int] NULL,
	[tenantCode] [nvarchar](30) NULL
	)END 
	GO
	
-----------------------------------------------------------------------------------------------------------------------------------------------------------
IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'ml' AND TABLE_NAME = 'appBehaviourAnalyticsDetails')
	BEGIN
   CREATE TABLE [ml].[appBehaviourAnalyticsDetails](
    [primaryId] [nvarchar](200) NOT NULL primary key,
	[id] [nvarchar](200) NULL,
	[storageMechanism] [nvarchar](150) NULL,
	[sessionIndex] [int] NULL,
	[firstEventTimestamp] [datetime] NULL,
	[firstEventId] [nvarchar](200) NULL,
	[sessionId] [nvarchar](200) NULL,
	[eventIndex] [int] NULL,
	[previousSessionId] [nvarchar](200) NULL,
	[userId] [nvarchar](200) NULL,
	[build] [nvarchar](100) NULL,
	[version] [nvarchar](100) NULL,
	[scale] [float] NULL,
	[language] [nvarchar](100) NULL,
	[isPortrait] [nvarchar](100) NULL,
	[resolution] [nvarchar](100) NULL,
	[totalStorage] [nvarchar](100) NULL,
	[systemAvailableMemory] [nvarchar](100) NULL,
	[osVersion] [nvarchar](100) NULL,
	[batteryState] [nvarchar](100) NULL,
	[availableStorage] [nvarchar](100) NULL,
	[osType] [nvarchar](100) NULL,
	[deviceModel] [nvarchar](100) NULL,
	[deviceManufacturer] [nvarchar](100) NULL,
	[networkType] [nvarchar](100) NULL,
	[physicalMemory] [nvarchar](100) NULL,
	[batteryLevel] [nvarchar](100) NULL,
	[name] [nvarchar](100) NULL,
	[backgroundSec] [float] NULL,
	[foregroundSec] [float] NULL,
	)END 
	GO
	
	
---------------------waterAssetDetails------------------------------------------------------------------------------------------------------------------------
IF OBJECT_ID('dbo.v_waterAssetDetails', 'V') IS NOT NULL
BEGIN
    -- Drop the view if it exists
    DROP VIEW dbo.v_waterAssetDetails;
END
GO

create view [dbo].[v_waterAssetDetails] AS

SELECT  
    CAST([sms].[PK_Controller_id] AS BIGINT) AS controllerId, 
    CAST([sms].[soilMoistureSensorId] AS NVARCHAR(150)) AS deviceId, 
    CAST(NULL AS INT) AS districtCoolingPlantId, 
    CAST(NULL AS INT) AS pipeId, 
    CAST(NULL AS INT) AS waterTreatmentPlantId, 
    CAST([sms].[SoilMoisutureSonsor_name] AS NVARCHAR(MAX)) AS name,
	 CAST([sms].[Latitude] AS FLOAT) AS latitude, 
    CAST([sms].[Longitude] AS FLOAT) AS longitude, 
    CAST([sms].[juridictionId] AS NVARCHAR(MAX)) AS jurisdictionid, 
    CAST([sms].[soilPH] AS FLOAT) AS ph_level,
	sms.moistureLevel  as moistureLevel,
    CAST([sms].[soilTemperature] AS FLOAT) AS temperature,
	
	NULL AS meterUsage, 
    sms.sensorStatus as operationalStatus,
	sms.timestamp as dateTime, 
	NULL AS flowRate,
	sms.uuid as macId,
	sms.status AS status, 
	NULL AS valveMeterReading, 
	sms.categoryName as category,
	sms.address as address, 
	sms.deviceProfileId as deviceProfileId, 
	NULL AS waterVolume,
	'soilMoistureSensor' AS categoryName, 
	sms.deviceTypeId as deviceTypeId,
	sms.pk_soilMoistureSensorId as ID, 
	sms.tenantCode as tenantCode, 
	NULL AS Reservoirid,
	NULL AS waterLevel,
	NULL AS tankId, 
	zn.zoneId as ZoneId,
	zn.name as zoneName 





   
FROM 
    [water].[soilMoistureSensorDetails]  [sms] left join [water].controllerDetails cn on cn.controllerId = sms.PK_Controller_id left join  [water].Zone zn on  zn.controller_id = cn.controllerId

UNION ALL

SELECT  
    CAST([fms].[PK_Controller_Id] AS BIGINT) AS controllerId, 
    CAST([fms].[flowMeterId] AS NVARCHAR(150)) AS deviceId, 
    CAST(NULL AS INT) AS districtCoolingPlantId, 
    CAST(NULL AS INT) AS pipeId, 
    CAST(NULL AS INT) AS waterTreatmentPlantId, 
    CAST([fms].[FlowMeter_name] AS NVARCHAR(MAX)) AS name ,
		 CAST([fms].[Latitude] AS FLOAT) AS latitude, 
    CAST([fms].[Longitude] AS FLOAT) AS longitude, 
    CAST([fms].[juridictionId] AS NVARCHAR(MAX)) AS jurisdictionid, 
    CAST(NULL AS FLOAT) AS ph_level, 
	 null as moistureLevel,
    CAST(NULL AS FLOAT) AS temperature,
	
		fms.meterusage AS meterUsage, 

    fms.health as operationalStatus,
	fms.timestamp as dateTime, 
	fms.flowRate AS flowRate,

		fms.uuid as macId,
	fms.status AS status, 
	NULL AS valveMeterReading, 
	fms.categoryName as category,
	fms.address as address, 
	fms.deviceProfileId as deviceProfileId, 
	NULL AS waterVolume,
	'flowMeter' AS categoryName, 
	fms.deviceTypeId as deviceTypeId,
	fms.pk_flowmeterId as ID, 
	fms.tenantCode as tenantCode, 
	NULL AS Reservoirid, 
	NULL AS waterLevel,
	NULL AS tankId,
	zn.zoneId,
	zn.name as  zoneName
   
FROM 
  [water].[flowMeterDetails]  [fms] left join  [water].controllerDetails cn on cn.controllerId = fms.PK_Controller_id left join  [water].Zone zn on  zn.controller_id = cn.controllerId
   
	union all


SELECT  
    CAST(NULL AS bigint) AS controllerId,  -- Changed to bigint
    CAST([fsd].[flowSensorId] AS NVARCHAR(150)) AS deviceId, 
    CAST(PK_District_cooling_plant_id AS INT) AS districtCoolingPlantId, 
    CAST(NULL AS INT) AS pipeId, 
    CAST(NULL AS INT) AS waterTreatmentPlantId, 
    CAST([fsd].[name] AS NVARCHAR(MAX)) AS name, 
    CAST(SUBSTRING(fsd.coordinates, 2, CHARINDEX(',', fsd.coordinates) - 2) AS FLOAT) AS longitude,
    CAST(SUBSTRING(fsd.coordinates, CHARINDEX(',', fsd.coordinates) + 1, LEN(fsd.coordinates) - CHARINDEX(',', fsd.coordinates) - 1) AS FLOAT) AS latitude,
    CAST([fsd].[jurisdictionId] AS NVARCHAR(MAX)) AS jurisdictionid, 
    CAST(NULL AS NVARCHAR(MAX)) AS ph_level, 
	 null as moistureLevel,
    CAST(fsd.temperatureRange AS NVARCHAR(MAX)) AS temperature,
	
    CAST(NULL AS NVARCHAR(MAX)) AS meterUsage, 
    CAST(fsd.status AS NVARCHAR(MAX)) AS operationalStatus,
    CAST(fsd.timestamp AS DATETIME) AS dateTime, 
    CAST(fsd.flowRate AS NVARCHAR(MAX)) AS flowRate,
	   CAST([fsd].uuid AS NVARCHAR(MAX)) AS macId, 
    
    CAST(fsd.status AS NVARCHAR(MAX)) AS status, 
    CAST(NULL AS NVARCHAR(MAX)) AS valveMeterReading, 
    CAST(fsd.categoryName AS NVARCHAR(MAX)) AS category,
    CAST(fsd.address AS NVARCHAR(MAX)) AS address, 
    CAST(fsd.deviceProfileId AS NVARCHAR(MAX)) AS deviceProfileId, 
    CAST(NULL AS NVARCHAR(MAX)) AS waterVolume,
	CAST('flowSensor' AS NVARCHAR(MAX)) AS categoryName, 
    CAST(fsd.deviceTypeId AS NVARCHAR(MAX)) AS deviceTypeId,
    CAST(fsd.pk_flowSensorId AS NVARCHAR(MAX)) AS ID, 
    CAST(fsd.tenantCode AS NVARCHAR(30)) AS tenantCode, 
    CAST(NULL AS NVARCHAR(MAX)) AS Reservoirid, 
    CAST(NULL AS NVARCHAR(MAX)) AS waterLevel ,
	NULL AS tankId,
    null as zoneId,
	null as zoneName
   
FROM 
   [water].[flowSensorDetails]  [fsd] 

-- Include the existing UNION ALL queries for other tables (e.g., soilMoistureSensorDetails, flowMeterDetails, etc.)

UNION ALL
SELECT  
    CAST(NULL AS BIGINT) AS controllerId, 
    CAST([psd].[PK_Pressure_Sensor_id] AS NVARCHAR(150)) AS deviceId, 
    CAST([psd].[PK_District_cooling_plant_id] AS INT) AS districtCoolingPlantId, 
    CAST(NULL AS INT) AS pipeId, 
    CAST(NULL AS INT) AS waterTreatmentPlantId,
    CAST([psd].[name] AS NVARCHAR(MAX)) AS name,
	CAST(SUBSTRING(psd.coordinates, 2, CHARINDEX(',', coordinates) - 2) AS FLOAT) AS longitude,
    CAST(SUBSTRING(psd.coordinates, CHARINDEX(',', coordinates) + 1, LEN(coordinates) - CHARINDEX(',', coordinates) - 1) AS FLOAT) AS latitude,
    [psd].[jurisdictionId] AS jurisdictionid, 
    NULL AS ph_level, 
	 null as moistureLevel,
	NULL as temperature,
	NULL AS meterUsage, 
    psd.status as operationalStatus,
	psd.timestamp as dateTime, 
	NULL AS flowRate,
	psd.uuid as macId,
	psd.status AS status, 
	NULL AS valveMeterReading, 
	psd.categoryName as category,
	psd.address as address, 
	psd.deviceProfileId as deviceProfileId, 
	NULL AS waterVolume,
	'pressureSensor' AS categoryName, 
	psd.deviceTypeId as deviceTypeId,
	psd.PK_ID as ID, 
	psd.tenantCode as tenantCode, 
	NULL AS Reservoirid, 
	NULL AS waterLevel,
	NULL AS tankId,
	NULL AS zoneId,
	null as zoneName
    
    
FROM 
    [water].[pressureSensor] AS [psd]


	union all 

	SELECT  
     CAST(NULL AS BIGINT) AS controllerId, 
cast(   [sbm].[PK_Smart_Bulk_Meters_id]AS NVARCHAR(150)) AS deviceId, 
    NULL AS  districtCoolingPlantId, 
    NULL AS pipeId, 
    PK_Water_Treatment_Plant_id AS waterTreatmentPlantId, 
    [sbm].[name] AS name,
	CAST(SUBSTRING(sbm.coordinates, 2, CHARINDEX(',', coordinates) - 2) AS FLOAT) AS longitude,
    CAST(SUBSTRING(sbm.coordinates, CHARINDEX(',', coordinates) + 1, LEN(coordinates) - CHARINDEX(',', coordinates) - 1) AS FLOAT) AS latitude,
    [sbm].[jurisdictionId] AS jurisdictionid, 
    NULL AS ph_level, 
	 null as moistureLevel,
	NULL as temperature,
	NULL AS meterUsage, 
    sbm.status as operationalStatus,
	sbm.lastReadingTime as dateTime, 
	sbm.flowRate AS flowRate,
    sbm.uuid as macId,
	sbm.status AS status, 
	NULL AS valveMeterReading,
	sbm.categoryName as category,
	sbm.address as address, 
	sbm.deviceProfileId as deviceProfileId, 
	NULL AS waterVolume,
	'bulkMeter' AS categoryName, 
	sbm.deviceTypeId as deviceTypeId,
	sbm.PK_ID as ID, 
	sbm.tenantCode as tenantCode, 
	NULL AS Reservoirid,
NULL AS waterLevel,	
	NULL AS tankId,
	NULL AS zoneId,
	null as zoneName

	FROM 
    [water].[smartBulkMeters] AS [sbm]
	

	union all 

	SELECT  

 cast (std.PK_Controller_id as bigint )AS controllerId, 
    cast([std].[smartTimersId] as nvarchar(150)) AS deviceId, 

    NULL AS  districtCoolingPlantId, 
    NULL AS pipeId, 
    NULL AS waterTreatmentPlantId, 
	
    [std].[name] AS name, 
  
    std.longitude AS longitude,
     std.latitude AS latitude,
    [std].[juridictionId] AS jurisdictionid, 
    NULL AS ph_level,
	 null as moistureLevel,
	std.operatingTemperature as temperature ,
		NULL AS meterUsage, 
    std.status as operationalStatus,
	std.timestamp as dateTime, 
	std.flowRate AS flowRate,
	std.uuid as macId,
	std.status AS status, 
	null as valveMeterReading,
	std.categoryName as category,
	std.address as address, 
	NULL as deviceProfileId, 
	std.waterVolume AS waterVolume,
	'smartTimers' AS categoryName, 
	std.deviceTypeId as deviceTypeId,
	std.pk_smartTimersId as ID, 
	std.tenantCode as tenantCode, 
	NULL AS Reservoirid,
NULL AS waterLevel,	
	
	NULL AS tankId,
	zn.zoneId,
	zn.name as zoneName
	

	FROM 
    [water].[smartTimerDetails] AS [std]   left join  [water].controllerDetails cn on cn.controllerId = std.PK_Controller_id left join  [water].Zone zn on  zn.controller_id = cn.controllerId


	union all 

	SELECT  
    NULL AS controllerId, 
    [spd].[sprinklerId] AS deviceId, 
    NULL AS  districtCoolingPlantId, 
    NULL AS pipeId, 
    NULL AS waterTreatmentPlantId, 

    [spd].[name] AS name, 
    
 NULL AS longitude,
    Null as latitude,
    NULL AS jurisdictionid, 
    NULL AS ph_level, 
	 null as moistureLevel,
	NULL as temperature,
		
NULL AS meterUsage, 
    spd.status as operationalStatus,
	spd.installationDate as dateTime, 
	spd.flowRate AS flowRate,
	
	spd.uuid as macId,
	spd.status AS status,
	
		NULL AS valveMeterReading, 
	'irrigation' as category,
	NULL AS  address, 
	NULL as deviceProfileId, 
	NULL AS waterVolume,
	'sprinkler' AS categoryName, 
	NULL as deviceTypeId,
	spd.pk_sprinklerId as ID, 
	spd.tenantCode as tenantCode, 
	NULL AS Reservoirid, 
	NULL AS waterLevel,	
	NULL AS tankId,
	zn.zoneId,
	zn.name as zoneName
	


	FROM 
    [water].[sprinklerDetails] AS [spd]  left join [water].[soilMoistureSensorDetails] sms on  sms.PK_Sprinkler_id = spd.sprinklerId  left join [water].Zone zn on  zn.controller_id = sms.PK_Controller_id


	union all 

	SELECT  
    NULL AS controllerId, 
    [vd].[valveId] AS deviceId, 
    NULL AS districtCoolingPlantId, 
    NULL AS pipeId, 
    NULL AS waterTreatmentPlantId, 
   
    [vd].[name] AS name, 

    CASE
        WHEN CHARINDEX(',', [vd].coordinates) > 0 THEN CAST(SUBSTRING([vd].coordinates, 2, CHARINDEX(',', [vd].coordinates) - 2) AS nvarchar(max))
        ELSE NULL
    END AS longitude,
    CASE
        WHEN CHARINDEX(',', [vd].coordinates) > 0 THEN CAST(SUBSTRING([vd].coordinates, CHARINDEX(',', [vd].coordinates) + 1, LEN([vd].coordinates) - CHARINDEX(',', [vd].coordinates) - 1) AS  nvarchar(max))
        ELSE NULL
    END AS latitude,
    vd.juridictionId AS jurisdictionid, 
    NULL AS ph_level,
	 null as moistureLevel,
    vd.temperature AS temperature ,
	vd.valveMeterReading AS meterUsage, 
    vd.status AS operationalStatus,
    vd.installationDate AS dateTime, 
    vd.flowRate AS flowRate,
    vd.uuid as macId,
    vd.status AS status,
	vd.valveMeterReading AS valveMeterReading, 	
    vd.categoryName AS category,
    NULL AS address, 
    NULL AS deviceProfileId, 
    NULL AS waterVolume,
	'valve' AS categoryName, 
    vd.deviceTypeId AS deviceTypeId,
    vd.pk_valveId AS ID, 
    vd.tenantCode AS tenantCode, 
    NULL AS Reservoirid, 
    NULL AS waterLevel,	 
    NULL AS tankId,
	NULL AS zoneId,
	NULL AS zoneName
	
	FROM 
    [water].[valveDetails] AS [vd] 



	union all 

	SELECT  
    NULL AS controllerId, 
    [wqs].[PK_Water_quality_sensor_id] AS deviceId, 
    NULL AS districtCoolingPlantId, 
    NULL AS pipeId, 
    wqs.PK_Water_Treatment_Plant_id  AS waterTreatmentPlantId, 
 
    [wqs].[name] AS name, 
 
    CASE
        WHEN CHARINDEX(',', [wqs].coordinates) > 0 THEN CAST(SUBSTRING([wqs].coordinates, 2, CHARINDEX(',', [wqs].coordinates) - 2) AS nvarchar(max))
        ELSE NULL
    END AS longitude,
    CASE
        WHEN CHARINDEX(',', [wqs].coordinates) > 0 THEN CAST(SUBSTRING([wqs].coordinates, CHARINDEX(',', [wqs].coordinates) + 1, LEN([wqs].coordinates) - CHARINDEX(',', [wqs].coordinates) - 1) AS  nvarchar(max))
        ELSE NULL
    END AS latitude,
    wqs.jurisdictionId AS jurisdictionid, 
    NULL AS ph_level,
	 null as moistureLevel,
    wqs.temperature AS temperature,
	NULL AS meterUsage, 
    wqs.status AS operationalStatus,
    wqs.installationDate AS dateTime, 
    NULL AS flowRate,
    wqs.uuid as macId,
    wqs.status AS status, 
	NULL AS valveMeterReading,
    wqs.categoryName AS category,
    NULL AS address, 
    wqs.deviceProfileId AS deviceProfileId, 
    NULL AS waterVolume,
	'waterQualitySensor' AS categoryName, 
    wqs.deviceTypeId AS deviceTypeId,
    wqs.PK_ID AS ID, 
    wqs.tenantCode AS tenantCode, 
    NULL AS Reservoirid, 
	NULL AS waterLevel,	
    NULL AS tankId,
	NULL AS zoneId,
	NULL AS zoneNane
	
	
	FROM 
    [water].[waterQualitySensor] AS [wqs]


	union all 

	SELECT  
    NULL AS controllerId, 
    cast([ssm].[smartSubMetersId] as nvarchar(max)) AS deviceId, 
    NULL AS  districtCoolingPlantId, 
    NULL AS pipeId, 
    NULL AS waterTreatmentPlantId, 

    [ssm].[name] AS name, 
 
    CAST(SUBSTRING(ssm.coordinates, 2, CHARINDEX(',', coordinates) - 2) AS nvarchar(max)) AS longitude,
    CAST(SUBSTRING(ssm.coordinates, CHARINDEX(',', coordinates) + 1, LEN(coordinates) - CHARINDEX(',', coordinates) - 1) AS nvarchar(max)) AS latitude,
    cast([ssm].[jurisdictionId] as nvarchar(max)) AS jurisdictionid, 
    NULL AS ph_level, 
	 null as moistureLevel,
	NULL as temperature,
	NULL AS meterUsage, 
    ssm.status as operationalStatus,
	ssm.installationDate as dateTime, 
	ssm.flowRate AS flowRate,
	ssm.uuid as macId,
	ssm.status AS status,
NULL AS valveMeterReading, 	
	ssm.categoryName as category,
	ssm.address as address, 
	cast(ssm.deviceProfileId as nvarchar(max)) as deviceProfileId, 
	NULL AS waterVolume,
	'subMeter' AS categoryName, 
	cast(ssm.deviceTypeId  as nvarchar(max))as deviceTypeId,
	cast(ssm.pk_smartSubMetersId  as nvarchar(max))as ID, 
	ssm.tenantCode as tenantCode, 
	NULL AS Reservoirid, 
	NULL AS waterLevel,
	NULL AS tankId,
	NULL AS zoneId,
	NULL AS zoneName
	

	FROM 
  [water].[smartSubMeterDetails] AS [ssm]

	union all

	SELECT  
   NULL AS controllerId, 
    cast([lds].[PK_Leak_Detection_Sensor_id] as nvarchar(max)) AS deviceId, 
    NULL AS  districtCoolingPlantId, 
    null AS pipeId, 
    NULL AS waterTreatmentPlantId, 
    [lds].[name] AS name, 
    CAST(SUBSTRING(lds.coordinates, 2, CHARINDEX(',', coordinates) - 2) AS nvarchar(max)) AS longitude,
    CAST(SUBSTRING(lds.coordinates, CHARINDEX(',', coordinates) + 1, LEN(coordinates) - CHARINDEX(',', coordinates) - 1) AS nvarchar(max)) AS latitude,
    cast ([lds].[jurisdictionId] as nvarchar(max)) AS jurisdictionid, 
    NULL AS ph_level, 
	 null as moistureLevel,
	null as temperature,
	NULL AS meterUsage, 
    lds.status as operationalStatus,
	lds.timestamp as dateTime, 
	cast(lds.flowRate as nvarchar(max)) AS flowRate,
	lds.uuid AS macId,	
	lds.status AS status, 
	NULL AS valveMeterReading, 
	lds.categoryName as category,
	lds.address as address, 
	lds.deviceProfileId as deviceProfileId, 
	NULL AS waterVolume ,
	'leakDetectionSensor' AS categoryName, 
	lds.deviceTypeId as deviceTypeId,
	cast(lds.PK_ID as nvarchar(max)) as ID, 
	lds.tenantCode as tenantCode, 
	NULL AS Reservoirid, 
	NULL AS waterLevel,
	NULL AS tankId,
	NULL AS zoneId,
	NULL AS zoneName


	 from 
	 [water].[leakDetectionSensor] AS [lds]


	 union all 

	  
	 SELECT  
    NULL AS controllerId, 
    [wls].[PK_Water_level_sensor_id] AS deviceId, 
    NULL AS districtCoolingPlantId, 
    NULL AS pipeId, 
    wls.PK_Water_Treatment_Plant_id  AS waterTreatmentPlantId, 

    [wls].[name] AS name, 
	    CASE
        WHEN CHARINDEX(',', [wls].coordinates) > 0 THEN CAST(SUBSTRING([wls].coordinates, 2, CHARINDEX(',', [wls].coordinates) - 2) AS nvarchar(max))
        ELSE NULL
    END AS longitude,
    CASE
        WHEN CHARINDEX(',', [wls].coordinates) > 0 THEN CAST(SUBSTRING([wls].coordinates, CHARINDEX(',', [wls].coordinates) + 1, LEN([wls].coordinates) - CHARINDEX(',', [wls].coordinates) - 1) AS  nvarchar(max))
        ELSE NULL
  

    END AS latitude,
    wls.jurisdictionId AS jurisdictionid, 
    NULL AS ph_level, 
	 null as moistureLevel,
    NULL AS temperature,
    NULL AS meterUsage, 
    wls.status AS operationalStatus,
    wls.installationDate AS dateTime, 
	  
    NULL AS flowRate,
	[wls].uuid AS macId,
    
    wls.status AS status, 
	NULL AS valveMeterReading, 
    wls.categoryName AS category,
    NULL AS address, 
    wls.deviceProfileId AS deviceProfileId, 
    NULL AS waterVolume, 
    'waterLevelSensor' AS categoryName, 
    wls.deviceTypeId AS deviceTypeId,
    wls.PK_ID AS ID, 
    wls.tenantCode AS tenantCode, 
    NULL AS Reservoirid,
NULL AS waterLevel,	
    NULL AS tankId,
	NULL As zoneId,
	NULL AS zoneName
FROM 
    [water].[waterLevelSensor] AS [wls]


	union all 


		select 
      NULL AS controllerId,
	  cast([pp].[pumpId] as nvarchar(max)) AS deviceId, 
	   NULL AS  districtCoolingPlantId,
	  null AS pipeId,
	   NULL AS waterTreatmentPlantId, 
	[pp].[name],
	CAST(SUBSTRING(pp.coordinates, 2, CHARINDEX(',', coordinates) - 2) AS nvarchar(max)) AS longitude,
    CAST(SUBSTRING(pp.coordinates, CHARINDEX(',', coordinates) + 1, LEN(coordinates) - CHARINDEX(',', coordinates) - 1) AS nvarchar(max)) AS latitude,
	cast ([pp].[jurisdictionId] as nvarchar(max)) AS jurisdictionid, 
    NULL AS ph_level, 
	 null as moistureLevel,
	NULL as temperature,
	NULL AS meterUsage, 
    pp.status as operationalStatus,
	pp.manufactureDate as dateTime,
   
	cast(pp.flowRate as nvarchar(max)) AS flowRate,
	 cast([pp].uuid as nvarchar(max)) AS macId,	
	pp.status AS status, 
	NULL AS valveMeterReading, 
	pp.categoryName as category,
	pp.address as address, 
	pp.deviceProfileId as deviceProfileId, 
	NULL AS waterVolume ,
	'pump' AS categoryName, 
	pp.deviceTypeId as deviceTypeId,
	cast(pp.PK_PumpId as nvarchar(max)) as ID, 
	pp.tenantCode as tenantCode, 
	NULL AS Reservoirid, 
	NULL AS waterLevel,
	NULL AS tankId,
	NULL AS zoneId,
	NULL AS zoneName
 from [water].[pumpDetails]  as pp


GO


----------------------------------iot.v_buildingDetails-------------------------------------------------------------------------------
	CREATE OR ALTER      VIEW [iot].[v_buildingDetails] AS
	select building.Id as fk_buildingId, building.peopleOccupancy, building.peopleCapacity, building.tenantCode, building.buildingName, building.buildingId, building.uniqueId, building.latitude as buildingLatitute, building.Longitude as buildingLongitute, floors.Id as pk_floorId, floors.floorId, floors.floorName, floors.latitude as floorLatitute, floors.longitude as floorLongitute, rooms.PK_Room_id as roomId, rooms.name as roomName, rooms.roomType, resource.resourceId, resource.name
	
	from [building].[buildingDetails] building   
	LEFT JOIN building.floorDetails floors
	ON building.Id = floors.buildingId_fk
	LEFT JOIN building.roomDetails rooms
	ON floors.Id = rooms.fk_floorId
	LEFT JOIN building.workforceDetails resource 
	ON building.Id = resource.fireStationId
	
GO
------------------------------------------------------------------------------------------------------------------------------------------