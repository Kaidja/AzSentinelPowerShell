#Filter Analytics rules based on the CreatedDateUtc property
$AzureSentinelWorkSpaceInfo = @{
    ResourceGroupName = "RG-PROD-IT-AZ-MANAGEMENT-TIER-0-WE"
    WorkspaceName = "LF-TIER-0-LOG-ANALYTICS-WE"
}

$TimeRange = (Get-Date).AddDays(-60)
Get-AzSentinelAlertRuleTemplate @AzureSentinelWorkSpaceInfo | 
    Where-Object {$PSItem.CreatedDateUtc -ge $TimeRange} |
        Select-Object -Property DisplayName,CreatedDateUtc,Severity |
            Sort-Object -Property CreatedDateUtc