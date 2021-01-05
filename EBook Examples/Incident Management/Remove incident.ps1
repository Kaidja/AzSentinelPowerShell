#Remove incident
$AzureSentinelWorkSpaceInfo = @{
    ResourceGroupName = "RG-PROD-IT-AZ-MANAGEMENT-TIER-0-WE"
    WorkspaceName = "LF-TIER-0-LOG-ANALYTICS-WE"
}

$IncidentID = "f4637e02-993c-454b-81a9-8b81a4596708"
Remove-AzSentinelIncident @AzureSentinelWorkSpaceInfo -IncidentId $IncidentID