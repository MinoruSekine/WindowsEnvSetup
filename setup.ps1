function ScoopInstallIfUnavailable($module_name) {
    if (Get-Command $module_name -ea SilentlyContinue) {
	return
    }
    scoop install $module_name
}

scoop bucket add extras
$install_module_array = @('cppcheck', 'dark', 'emacs', 'innounp', 'mobaxterm', 'python')
foreach ($command_to_install in $install_module_array) {
    ScoopInstallIfUnavailable $command_to_install
}
