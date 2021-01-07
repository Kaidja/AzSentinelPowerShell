$AzureSentinelWorkSpaceInfo = @{
    ResourceGroupName = "RG-PROD-IT-AZ-MANAGEMENT-TIER-0-WE"
    WorkspaceName = "LF-TIER-0-LOG-ANALYTICS-WE"
}

$BookMark = Get-AzSentinelBookmark @AzureSentinelWorkSpaceInfo | 
    Where-Object {$PSItem.DisplayName -eq "Get Windows Defender Status from Windows Servers"}

Remove-AzSentinelBookmark @AzureSentinelWorkSpaceInfo -BookmarkId $BookMark.Name