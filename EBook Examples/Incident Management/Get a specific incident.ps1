#Get a specific incident
$IncidentID = "499d8110-790e-43d9-a9d9-a15f0539fcf0"
Get-AzSentinelIncident @AzInfo -IncidentId $IncidentID