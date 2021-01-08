$AzureSentinelWorkSpaceInfo = @{
    ResourceGroupName = "RG-PROD-IT-AZ-MANAGEMENT-TIER-0-WE"
    WorkspaceName = "LF-TIER-0-LOG-ANALYTICS-WE"
}

$AnalyticsRule = Get-AzSentinelAlertRuleTemplate @AzureSentinelWorkSpaceInfo | 
    Where-Object {$PSItem.DisplayName -eq "Rare application consent"}

#Scheduled based Template info

$ScheduledBasedTemplateInfo = @{
    AlertRuleTemplateName = $AnalyticsRule.Name
    Enabled = $True
    DisplayName = $AnalyticsRule.DisplayName
    Scheduled = $True
    Query = $AnalyticsRule.Query
    QueryFrequency = $AnalyticsRule.QueryFrequency
    QueryPeriod = $AnalyticsRule.QueryPeriod
    Severity = $AnalyticsRule.Severity
    TriggerThreshold = $AnalyticsRule.TriggerThreshold
    TriggerOperator = $AnalyticsRule.TriggerOperator

}

New-AzSentinelAlertRule @AzureSentinelWorkSpaceInfo @ScheduledBasedTemplateInfo