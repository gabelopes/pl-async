Param([Switch] $Force = $False)

$LibraryName = "async.pl"
$PrologCommand = "swipl"
$PrologPath = (Get-Command $PrologCommand).Source
$PrologLibraryPath = (Resolve-Path -Path "$PrologPath\..\..\library").Path
$LibraryPath = "$PSScriptRoot\$LibraryName"
$DestinationPath = "$PrologLibraryPath\$LibraryName"

If (-not(Test-Path $DestinationPath -PathType Leaf) -or $Force) {
  Copy-Item -Force -Path $LibraryPath -Destination $DestinationPath
} Else {
  echo "File with name '$LibraryName' already exists in '$PrologLibraryPath'. If you would like to overwrite it, run this script with -Force parameter."
}