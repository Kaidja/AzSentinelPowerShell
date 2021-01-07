$AzureSentinelWorkSpaceInfo = @{
    ResourceGroupName = "RG-PROD-IT-AZ-MANAGEMENT-TIER-0-WE"
    WorkspaceName = "LF-TIER-0-LOG-ANALYTICS-WE"
}    
Get-AzSentinelDataConnector @AzureSentinelWorkSpaceInfo |
    Select-Object -Property Kind,Name