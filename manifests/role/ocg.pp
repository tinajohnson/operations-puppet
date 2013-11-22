# vim: set ts=4 et sw=4:
# role/ocg.pp
# offline content generator

# Virtual resources for the monitoring server
@monitor_group { "ocg_eqiad": description => "offline content generator eqiad" }

class role::ocg {
    system::role { "ocg": description => "offline content generator base" }

    include standard

    package {
        [ 'nodejs' ]:
            ensure => latest;
    }
}

class role::ocg::test {
    system::role { "ocg-test": description => "offline content generator testing" }

    class { 'redis':
        maxmemory => '500Mb',
        password  => $passwords::redis::ocg_test_password,
    }
}