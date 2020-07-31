function ScoopInstallIfUnavailable($module_name) {
    if (Get-Command $module_name -ea SilentlyContinue) {
	return
    }
    scoop install $module_name
}

# Add "extras" bucket if not available.
$extra_available=$FALSE
$scoop_bucket_list_result=scoop bucket list
foreach ($line in $scoop_bucket_list_result) {
    if ($line -match "^extras$") {
	$extra_available=$TRUE
	break
    }
}
if (!$extra_available) {
    scoop bucket add extras
}

# Install each modules.
$install_module_array = @('cppcheck', 'dark', 'emacs', 'innounp', 'mobaxterm', 'python')
foreach ($command_to_install in $install_module_array) {
    ScoopInstallIfUnavailable $command_to_install
}

# Post install processes.
scoop cleanup *
scoop checkup
