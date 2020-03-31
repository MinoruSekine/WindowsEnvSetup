function ScoopInstallIfUnavailable($module_name) {
    if (Get-Command $module_name -ea SilentlyContinue) {
	return
    }
    scoop install $module_name
}

scoop bucket add extras
$command_array = @('cppcheck', 'dark', 'emacs', 'innounp', 'mobaxterm')
foreach ($command_to_install in $command_array) {
    ScoopInstallIfUnavailable $command_to_install
}
