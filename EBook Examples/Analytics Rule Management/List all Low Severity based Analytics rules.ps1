#List all Low Severity based Analytics rules
$AzureSentinelWorkSpaceInfo = @{
    ResourceGroupName = "RG-PROD-IT-AZ-MANAGEMENT-TIER-0-WE"
    WorkspaceName = "LF-TIER-0-LOG-ANALYTICS-WE"
}

Get-AzSentinelAlertRuleTemplate @AzureSentinelWorkSpaceInfo | 
    Where-Object {$PSItem.Severity -eq "Low"} |
        Select-Object -Property DisplayName,Severity