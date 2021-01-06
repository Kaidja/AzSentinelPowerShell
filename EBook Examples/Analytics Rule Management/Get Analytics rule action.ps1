#Get Analytics rule action
$AzureSentinelWorkSpaceInfo = @{
    ResourceGroupName = "RG-PROD-IT-AZ-MANAGEMENT-TIER-0-WE"
    WorkspaceName = "LF-TIER-0-LOG-ANALYTICS-WE"
}

$AlertRuleId = "84d3a26d-1a32-4992-8c35-769cb2a98032"
Get-AzSentinelAlertRuleAction @AzureSentinelWorkSpaceInfo -AlertRuleId $AlertRuleId