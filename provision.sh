#!/bin/bash

set -o nounset
set -o errexit

readonly Progname=$(basename "$0")
readonly Progdir=$(readlink -m $(dirname "$0"))
readonly Args="$@"

clojure () {
    echo "Installing clojure"

    apt-get install -y default-jre
    wget -q -O /home/vagrant/bin/lein https://raw.githubusercontent.com/technomancy/leiningen/stable/bin/lein
    chmod a+x /home/vagrant/bin/lein
    chown vagrant:vagrant /home/vagrant/bin/lein
}

main () {
    echo "PROVISIONING"

    export DEBIAN_FRONTEND=noninteractive

    # Update apt cache
    apt-get update &> /dev/null
    apt-get autoclean &> /dev/null
    apt-get autoremove -y &> /dev/null

    # Install some base software
    apt-get install -y curl vim &> /dev/null

    # Create bin dir for user vagrant
    mkdir -p /home/vagrant/bin
    chown vagrant:vagrant /home/vagrant/bin

    # Add greeting
    echo "Hello 💧 Lemming :)" > /etc/motd

    clojure
}
main $Args
