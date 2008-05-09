#######################################
# iptables module
# Puzzle ITC - haerry+puppet(at)puzzle.ch
# GPLv3
#######################################


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
