$AzureSentinelWorkSpaceInfo = @{
    ResourceGroupName = "RG-PROD-IT-AZ-MANAGEMENT-TIER-0-WE"
    WorkspaceName = "LF-TIER-0-LOG-ANALYTICS-WE"
}

$BookMark = Get-AzSentinelBookmark @AzureSentinelWorkSpaceInfo | 
    Where-Object {$PSItem.DisplayName -eq "Get Windows Defender Status from Windows Servers"}

Update-AzSentinelBookmark @AzureSentinelWorkSpaceInfo -BookmarkId $BookMark.Name -Note "Check out the Server1. Something seems wrong with that"