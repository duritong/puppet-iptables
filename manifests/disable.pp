#######################################
# iptables module - disable.pp
# Puzzle ITC - haerry+puppet(at)puzzle.ch
# GPLv3
#######################################

# disable iptables
class iptables::disable inherits iptables::base {
    Service[iptables]{
        ensure => stopped,
        enable => false,
    }
    Service[ip6tables]{
        ensure => stopped,
        enable => false,
    }
}
