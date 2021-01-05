#Get all incidents and convert the CreatedTimeUTC to local date time
Function Convert-UTCtoLocal
{

#Source - https://devblogs.microsoft.com/scripting/powertip-convert-from-utc-to-my-local-time-zone/ PowerTip: Convert from UTC to my local time zone | Scripting Blog (microsoft.com)
#Author - Thomas Rayner


    Param(
        [Parameter(Mandatory=$True)]
        [String]$UTCTime
        )

    $CurrentTimeZone = (Get-WmiObject win32_timezone).StandardName
    $TimeZone = [System.TimeZoneInfo]::FindSystemTimeZoneById($CurrentTimeZone)
    $LocalTime = [System.TimeZoneInfo]::ConvertTimeFromUtc($UTCTime, $TimeZone)
    
    $LocalTime
}

$ProcessedIncidents = @()

$AzureSentinelWorkSpaceInfo = @{
    ResourceGroupName = "RG-PROD-IT-AZ-MANAGEMENT-TIER-0-WE"
    WorkspaceName = "LF-TIER-0-LOG-ANALYTICS-WE"
}

$Incidents = Get-AzSentinelIncident @AzureSentinelWorkSpaceInfo
foreach($Incident in $Incidents){

    $IncidentDetails = [ORDERED]@{
        IncidentID = $Incident.Name
        CreatedTime = Convert-UTCtoLocal -UTCTime $Incident.CreatedTimeUTC
        Title = $Incident.Title
        Status = $Incident.Status
    }

    $PoshObject = New-Object -TypeName PSObject -Property $IncidentDetails
    $ProcessedIncidents += $PoshObject
}
$ProcessedIncidents