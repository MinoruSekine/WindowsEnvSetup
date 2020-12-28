function ScoopInstallIfUnavailable($module_name) {
    if (Get-Command $module_name -ea SilentlyContinue) {
	return
    }
    scoop install $module_name
}

function IsScoopBucketAvailable($bucket_name) {
    $scoop_bucket_list_result=scoop bucket list
    foreach ($line in $scoop_bucket_list_result) {
	if ($line -match "^" + $bucket_name + "$") {
	    return $TRUE
	}
    }
    return $FALSE
}

function ScoopAddBucketIfUnavailable($bucket_name) {
    if (!(IsScoopBucketAvailable $bucket_name)) {
	scoop bucket add $bucket_name
    }
}

# Add buckets if not available.
$add_bucket_array = @('extras', 'java')
foreach ($bucket in $add_bucket_array) {
    ScoopAddBucketIfUnavailable $bucket
}

# Install each modules.
$install_module_array = @('cppcheck',
			  'dark',
			  'emacs',
			  'innounp',
			  'mobaxterm',
			  'openjdk',
			  'plantuml',
			  'python')
foreach ($command_to_install in $install_module_array) {
    ScoopInstallIfUnavailable $command_to_install
}

# Post install processes.
scoop cleanup *
scoop checkup
