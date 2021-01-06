$AzureSentinelWorkSpaceInfo = @{
    ResourceGroupName = "RG-PROD-IT-AZ-MANAGEMENT-TIER-0-WE"
    WorkspaceName = "LF-TIER-0-LOG-ANALYTICS-WE"
}

$AnalyticsRule = Get-AzSentinelAlertRule @AzureSentinelWorkSpaceInfo | 
    Where-Object {$PSItem.DisplayName -eq "Log Analytics Agent Health"}

Update-AzSentinelAlertRule @AzureSentinelWorkSpaceInfo -AlertRuleId $AnalyticsRule.Name -Disabled