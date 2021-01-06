#Add a new automated response for the Analytics rule
$AzureSentinelWorkSpaceInfo = @{
    ResourceGroupName = "RG-PROD-IT-AZ-MANAGEMENT-TIER-0-WE"
    WorkspaceName = "LF-TIER-0-LOG-ANALYTICS-WE"
}

$LogicAppsInfo = @{
    ResourceGroupName = "RG-PROD-IT-LOGIC-APPS-WE"
    Name = "Post-Message-Teams"
}

$LogicAppResourceID = Get-AzLogicApp @LogicAppsInfo
$LogicAppTriggerURI = Get-AzLogicAppTriggerCallbackUrl @LogicAppsInfo -TriggerName "When_a_response_to_an_Azure_Sentinel_alert_is_triggered"

$AnalyticsRule = Get-AzSentinelAlertRule @AzureSentinelWorkSpaceInfo | 
    Where-Object {$PSItem.DisplayName -eq "Log Analytics Agent Health"}

New-AzSentinelAlertRuleAction @AzureSentinelWorkSpaceInfo -AlertRuleId $AnalyticsRule.Name -LogicAppResourceId ($LogicAppResourceID.Id) -TriggerUri ($LogicAppTriggerURI.Value)