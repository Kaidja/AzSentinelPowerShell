#Update the incident details - add incident owner and set the status to Active
Connect-AzureAD

$AzureADUserDetails = Get-AzureADUser -ObjectId "John@Contoso.com"
$IncidentID = "499d8110-790e-43d9-a9d9-a15f0539fcf0"

$IncidentOwnerDetails = @{
        AssignedTo = $AzureADUserDetails.DisplayName
        Email = $AzureADUserDetails.Mail
        Objectid = $AzureADUserDetails.ObjectId
        UserPrincipalName = $AzureADUserDetails.UserPrincipalName
}

$AzureSentinelWorkSpaceInfo = @{
    ResourceGroupName = "RG-PROD-IT-AZ-MANAGEMENT-TIER-0-WE"
    WorkspaceName = "LF-TIER-0-LOG-ANALYTICS-WE"
}

$IncidentOwner = New-AzSentinelIncidentOwner @IncidentOwnerDetails

Update-AzSentinelIncident @AzureSentinelWorkSpaceInfo -IncidentID $IncidentID -Owner $IncidentOwner -Status Active
