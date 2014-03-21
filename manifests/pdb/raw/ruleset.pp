#
define syslogng::pdb::raw::ruleset (
	$source,
	$ensure = "present",
	$recurse = true,
	$sourceselect = "all",
)
{
	validate_string($source)
	validate_string($ensure)
	validate_string($sourceselect)
	validate_bool($recurse)

	if ! defined(Class['Syslogng::Pdb']) {
		include syslogng::pdb
	}

	if ! defined(Class['Syslogng::Pdb::Deploy']) {
		include syslogng::pdb::deploy
	}

	if $ensure == 'directory' {
		file { "${syslogng::pdb::pdb_dir}/${name}":
			ensure      => $ensure,
			recurse => $recurse,
			mode        => 0644,
			source     => $source,
			sourceselect => $sourceselect,
			notify      => Exec['update-patterndb']
		}
	} else {
		file { "${syslogng::pdb::pdb_dir}/${name}.pdb":
			ensure      => $ensure,
			mode        => 0644,
			source     => $source,
			notify      => Exec['update-patterndb']
		}
	}
}
