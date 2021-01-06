#List all Analytics rules where Data Sources contains "SecurityEvents"
$AzureSentinelWorkSpaceInfo = @{
    ResourceGroupName = "RG-PROD-IT-AZ-MANAGEMENT-TIER-0-WE"
    WorkspaceName = "LF-TIER-0-LOG-ANALYTICS-WE"
}
Get-AzSentinelAlertRuleTemplate @AzureSentinelWorkSpaceInfo | 
    Where-Object {$PSItem.RequiredDataConnectors.ConnectorId -contains "SecurityEvents"} |
        Select-Object -Property DisplayName,Status,CreatedDateUtc,Severity,Name,RequiredDataConnectors |
            Sort-Object -Property Severity