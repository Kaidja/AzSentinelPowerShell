#Add a comment to an incident
$AzureSentinelWorkSpaceInfo = @{
    ResourceGroupName = "RG-PROD-IT-AZ-MANAGEMENT-TIER-0-WE"
    WorkspaceName = "LF-TIER-0-LOG-ANALYTICS-WE"
}

$IncidentID = "499d8110-790e-43d9-a9d9-a15f0539fcf0"
New-AzSentinelIncidentComment @AzureSentinelWorkSpaceInfo -IncidentId $IncidentID -Message "<h2>We can use HTML too!!!</h2>"