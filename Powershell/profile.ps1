$config = @{}
[xml]$configXML = Get-Content C:\Users\Simon\powershell_config.xml
foreach($setting in $configXML.settings.setting)
{
	$config.Add($setting.name, $setting.value)
}

echo $config

function vim($file) { & 'C:\Program Files (x86)\Vim\vim73\gvim.exe' + $file }
function cbm{ change_buster_dir("MobileTrunk") }
function cbw{ change_buster_dir("work") }
function cbw2 { change_buster_dir("work2") }
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

function bbra($src, $dest){
  $srcDir = $config.buster_svn + "/branches/"+$src
  $destDir = $config.buster_svn + "/branches/"+$dest
  echo "SRC: "  $srcDir
  echo "DEST: " $destDir

  $commitMsg = "Working branch for " +$dest
  svn cp $srcDir $destDir -m $commitMsg
  svn sw $destDir
}

$dotfiles = resolve-path ~/dotfiles/
$scripts = join-path $dotfiles "Powershell"
. (join-path $scripts "Aliases.ps1")

# Vim-style shorten-path originally from Tomas Restrepo
# https://github.com/tomasr
function get-vimShortPath([string] $path) {
   $loc = $path.Replace($HOME, '~')
	 $loc = $loc.Replace($env:WINDIR, '[Windows]')
   # remove prefix for UNC paths
   $loc = $loc -replace '^[^:]+::', ''
   # make path shorter like tabs in Vim,
   # handle paths starting with \\ and . correctly
   return ($loc -replace '\\(\.?)([^\\])[^\\]*(?=\\)','\$1$2')
}

$env:EDITOR = "gvim"
$env:VISUAL = $env:EDITOR
$env:GIT_EDITOR = $env:EDITOR
$env:TERM = "msys"


