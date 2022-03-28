$AzureSentinelWorkSpaceInfo = @{
    ResourceGroupName = "RG-PROD-IT-AZ-MANAGEMENT-TIER-0-WE"
    WorkspaceName = "LF-TIER-0-LOG-ANALYTICS-WE"
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
        ForEach-Object {Add-Content -Value $_ -Path "C:\AzureSentinelAnalyticsRulesBasicDetails2.csv"}
    
}
