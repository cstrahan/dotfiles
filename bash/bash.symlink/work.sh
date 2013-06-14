# -*- mode: Sh; -*-
# vim: ts=4 sts=4 shiftwidth=4 expandtab ft=sh

# ----------------------------------------------------------------------
#  Chruby
# ----------------------------------------------------------------------

source ~/bash/vendor/chruby/chruby.sh
#source ~/bash/vendor/chruby/auto.sh

function chruby-rehash {
    RUBIES=`ls /opt | egrep '^ruby-.*|jruby'`
}

chruby-rehash

# ----------------------------------------------------------------------
#  Aliases
# ----------------------------------------------------------------------

function avocado() {
    export PATH=/opt/ruby-1.9.3/bin:$PATH
    chruby ruby-1.9.3
    cd /u/apps/avocado/current
}

function pipeline() {
    export PATH=/opt/ruby-1.9.3/bin:$PATH
    cd /u/apps/pipeline/current
}
