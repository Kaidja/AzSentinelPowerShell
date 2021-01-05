# List all incidents and select only Title,CreatedTimeUTC properties and then sort based on the CreatedTimeUTC property
$AzureSentinelWorkSpaceInfo = @{
    ResourceGroupName = "RG-PROD-IT-AZ-MANAGEMENT-TIER-0-WE"
    WorkspaceName = "LF-TIER-0-LOG-ANALYTICS-WE"
}
Get-AzSentinelIncident @AzureSentinelWorkSpaceInfo | 
    Select-Object -Property Title,CreatedTimeUTC | 
        Sort-Object -Property CreatedTimeUTC -Descending