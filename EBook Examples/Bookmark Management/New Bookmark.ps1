$AzureSentinelWorkSpaceInfo = @{
    ResourceGroupName = "RG-PROD-IT-AZ-MANAGEMENT-TIER-0-WE"
    WorkspaceName = "LF-TIER-0-LOG-ANALYTICS-WE"
}    

$BookMarkQuery = @"
let AllWindowsServers =
Heartbeat 
| where OSType == 'Windows' and OSType != "Linux"
| summarize arg_max(TimeGenerated, *) by SourceComputerId
| summarize makeset(Computer);
ProtectionStatus
| where Computer in (AllWindowsServers)
| sort by TimeGenerated desc
| summarize arg_max(TimeGenerated, *) by SourceComputerId
| summarize  count() by TypeofProtection, AMProductVersion
"@

$DisplayName = "Get Windows Defender Status from Windows Servers"
$Notes = "Please review"

New-AzSentinelBookmark @AzureSentinelWorkSpaceInfo -DisplayName $DisplayName -Query $BookMarkQuery -Note $Notes