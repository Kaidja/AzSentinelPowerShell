#Connect to Azure 
Connect-AzAccount

#Run the Set-AzContext only, if you have multiple subscriptions
#Set-AzContext -Subscription "YOUR SUBSCRIPTION ID"

#Define the Azure Sentinel workspace information
$AzureSentinelWorkSpaceInfo = @{
    ResourceGroupName = "RG-PROD-IT-AZ-MANAGEMENT-TIER-0-WE"
    WorkspaceName = "LF-TIER-0-LOG-ANALYTICS-WE"
}

$Rules = Get-AzSentinelAlertRuleTemplate @AzureSentinelWorkSpaceInfo

foreach($Rule in $Rules){
    
    #Properties to export
    $TemplateInfo = @{
        AlertRuleTemplateName = $Rule.Name
        DisplayName = $Rule.DisplayName
        Query = $Rule.Query
        QueryFrequency = $Rule.QueryFrequency
        QueryPeriod = $Rule.QueryPeriod
        Severity = $Rule.Severity
        TriggerThreshold = $Rule.TriggerThreshold
        TriggerOperator = $Rule.TriggerOperator
        Kind = $Rule.Kind
    }

    $JSON = $TemplateInfo | ConvertTo-Json
    $JSON | Out-File -FilePath "($env:USERPROFILE)\Desktop\$($TemplateInfo.DisplayName).json"

}