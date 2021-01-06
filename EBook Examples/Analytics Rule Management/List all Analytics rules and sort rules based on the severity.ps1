#List all Analytics rules and sort rules based on the severity
$AzureSentinelWorkSpaceInfo = @{
    ResourceGroupName = "RG-PROD-IT-AZ-MANAGEMENT-TIER-0-WE"
    WorkspaceName = "LF-TIER-0-LOG-ANALYTICS-WE"
}
Get-AzSentinelAlertRuleTemplate @AzureSentinelWorkSpaceInfo | 
    Select-Object -Property DisplayName,Status,CreatedDateUtc,Severity | 
        Sort-Object -Property Severity -Descending