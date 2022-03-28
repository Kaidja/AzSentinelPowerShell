$AzureSentinelWorkSpaceInfo = @{
    ResourceGroupName = "PROD-IT-AZ-SECURITY-MGMT-WE"
    WorkspaceName = "PROD-IT-LOG-ANALYTICS-WE"
}

$Rules = Get-AzSentinelAlertRuleTemplate @AzureSentinelWorkSpaceInfo

foreach($Rule in $Rules){

    $RuleProperties = [ORDERED]@{
        DisplayName = $Rule.DisplayName
        Name = $Rule.Name
        CreatedDateUtc = $Rule.CreatedDateUtc
        Severity = $Rule.Severity
        Kind = $Rule.Kind
    }

    $i = 0
    foreach($DataType in $Rule.RequiredDataConnectors){
    
        $RuleProperties += @{"Datasource$i" = "$($DataType.DataTypes) ($($DataType.ConnectorId))"}

        $i++
    }

    $RuleObject = New-Object -TypeName PSObject -Property $RuleProperties
    $RuleObject | ConvertTo-Csv -OutVariable RuleObjectCSV -NoTypeInformation -Delimiter ";" |Out-Null

    $RuleObjectCSV[1..($RuleObjectCSV.count - 1)] | 
        ForEach-Object {Add-Content -Value $_ -Path "C:\Users\KaidoJärvemets\OneDrive - LakeForest Consulting\Desktop\AzSentinel\AzureSentinelAnalyticsRulesBasicDetails2.csv"}
    
}
