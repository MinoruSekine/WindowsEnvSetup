function ScoopInstallIfUnavailable($module_name) {
    if (Get-Command $module_name -ea SilentlyContinue) {
	return
    }
    scoop install $module_name
}

function IsScoopExtrasBucketAvailable {
    $scoop_bucket_list_result=scoop bucket list
    foreach ($line in $scoop_bucket_list_result) {
	if ($line -match "^extras$") {
	    return $TRUE
	}
    }
    return $FALSE
}

# Add "extras" bucket if not available.
$is_install_extras_necessary=IsScoopExtrasBucketAvailable
if (!$is_install_extras_necessary) {
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
