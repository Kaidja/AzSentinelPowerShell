$AzureSentinelWorkSpaceInfo = @{
    ResourceGroupName = "RG-PROD-IT-AZ-MANAGEMENT-TIER-0-WE"
    WorkspaceName = "LF-TIER-0-LOG-ANALYTICS-WE"
}    
New-AzSentinelDataConnector @AzureSentinelWorkSpaceInfo -AzureSecurityCenter -SubscriptionId "%YOURSUBSCRIPTIONID%" -Alerts Enabled