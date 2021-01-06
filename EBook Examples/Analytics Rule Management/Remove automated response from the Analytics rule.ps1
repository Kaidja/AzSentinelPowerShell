#Remove automated response from the Analytics rule 
$AzureSentinelWorkSpaceInfo = @{
    ResourceGroupName = "RG-PROD-IT-AZ-MANAGEMENT-TIER-0-WE"
    WorkspaceName = "LF-TIER-0-LOG-ANALYTICS-WE"
}

$AnalyticsRule = Get-AzSentinelAlertRule @AzureSentinelWorkSpaceInfo | 
    Where-Object {$PSItem.DisplayName -eq "Log Analytics Agent Health"}

$AlertRuleAction = Get-AzSentinelAlertRuleAction @AzureSentinelWorkSpaceInfo -AlertRuleId $AnalyticsRule.Name

Remove-AzSentinelAlertRuleAction @AzureSentinelWorkSpaceInfo -AlertRuleId $AnalyticsRule.Name -ActionId $AlertRuleAction.Name