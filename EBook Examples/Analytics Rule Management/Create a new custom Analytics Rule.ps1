$AzureSentinelWorkSpaceInfo = @{
    ResourceGroupName = "RG-PROD-IT-AZ-MANAGEMENT-TIER-0-WE"
    WorkspaceName = "LF-TIER-0-LOG-ANALYTICS-WE"
}

$NewAnalyticsRuleData = @{
    Scheduled = $True
    Enabled = $True
    Query = "Heartbeat
    | summarize LastHeartbeat=max(TimeGenerated) by Computer
    | where LastHeartbeat < ago(5m)
    | extend HostCustomEntity = Computer"

    DisplayName = "Log Analytics Agent Health"
    Description = "Get disconnected Log Analytics nodes"
    QueryPeriod = (New-TimeSpan -Hours 1)
    QueryFrequency = (New-TimeSpan -Hours 1)
    TriggerThreshold = 0
    TriggerOperator = "GreaterThan" #Equal, GreaterThan, LessThan, NotEqual
    Severity = "Medium" # Low, Medium, High
}

New-AzSentinelAlertRule @AzureSentinelWorkSpaceInfo @NewAnalyticsRuleData