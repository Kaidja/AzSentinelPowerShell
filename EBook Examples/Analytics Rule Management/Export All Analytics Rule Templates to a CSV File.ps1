$AzureSentinelWorkSpaceInfo = @{
    ResourceGroupName = "RG-PROD-IT-AZ-MANAGEMENT-TIER-0-WE"
    WorkspaceName = "LF-TIER-0-LOG-ANALYTICS-WE"
}

Get-AzSentinelAlertRuleTemplate @AzureSentinelWorkSpaceInfo | Select-Object -Property DisplayName,Name,CreatedDateUtc,Severity | 
    Export-Csv -Path "$($ENv:USERPROFILE)\Desktop\AzureSentinelAnalyticsRules.csv" -NoTypeInformation -UseCulture