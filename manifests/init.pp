#
# iptables module
#
# Copyright 2008, Puzzle ITC GmbH
# Marcel Härry haerry+puppet(at)puzzle.ch
# Simon Josi josi+puppet(at)puzzle.ch
#
# This program is free software; you can redistribute 
# it and/or modify it under the terms of the GNU 
# General Public License version 3 as published by 
# the Free Software Foundation.
#

# modules_dir { "iptables": }

class iptables {
    include iptables::base 
}

class iptables::base {
    package{[ 'iptables', 'iptables-ipv6']:
        ensure => present,
    }
    service{iptables:
        ensure => running,
        enable => true,
        require => Package[iptables],
    }
    service{ip6tables:
        ensure => running,
        enable => true,
        require => Package[iptables-ipv6],
    }
}
