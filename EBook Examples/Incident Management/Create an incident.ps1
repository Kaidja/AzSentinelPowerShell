#Create an incident
$AzureSentinelWorkSpaceInfo = @{
    ResourceGroupName = "RG-PROD-IT-AZ-MANAGEMENT-TIER-0-WE"
    WorkspaceName = "LF-TIER-0-LOG-ANALYTICS-WE"
}

New-AzSentinelIncident @AzureSentinelWorkSpaceInfo -Title "New incident from PowerShell" -Description "We must investigate this ASAP" -Severity Low -Status New