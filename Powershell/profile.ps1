$config = @{}
[xml]$configXML = Get-Content C:\Users\Simon\powershell_config.xml
foreach($setting in $configXML.settings.setting)
{
	$config.Add($setting.name, $setting.value)
}

echo $config

function cbm{ change_buster_dir("MobileTrunk") }
function cbw{ change_buster_dir("work") }
function cbp{ change_buster_dir("peer") }
function doc{ Set-Location $config.doc_dir }
function scripts { Set-Location $config.scripts_dir }

function change_buster_dir($folder)
{
	$dir = $config.buster_dir + $folder
	Set-Location $dir
}

function bsw($branch)
{

	$dir = $config.buster_svn + "/branches/"+$branch
	echo $dir
	svn sw $dir
}

function bswt
{
	$dir = $config.buster_svn+ "/trunk"
	echo $dir
	svn sw $dir
}
