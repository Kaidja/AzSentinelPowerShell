#Get Analytics rule action detailed information
$AzureSentinelWorkSpaceInfo = @{
    ResourceGroupName = "RG-PROD-IT-AZ-MANAGEMENT-TIER-0-WE"
    WorkspaceName = "LF-TIER-0-LOG-ANALYTICS-WE"
}

$LogicAppsInfo = @{
    ResourceGroupName = "RG-PROD-IT-LOGIC-APPS-WE"
}

$AlertRuleId = "84d3a26d-1a32-4992-8c35-769cb2a98032"
$AlertRuleAction = Get-AzSentinelAlertRuleAction @AzureSentinelWorkSpaceInfo -AlertRuleId $AlertRuleId
$AlertRuleActionName = $AlertRuleAction.LogicAppResourceId | Split-Path -Leaf
Get-AzLogicApp @LogicAppsInfo -Name $AlertRuleActionName