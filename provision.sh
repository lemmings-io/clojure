#!/bin/bash

set -o nounset
set -o errexit

readonly BasePath="/lemmings"

clojure () {
    echo "Installing clojure"

    apt-get install -y default-jre
    wget -q -O /home/vagrant/bin/lein https://raw.githubusercontent.com/technomancy/leiningen/stable/bin/lein
    chmod a+x /home/vagrant/bin/lein
    chown vagrant:vagrant /home/vagrant/bin/lein

    cp -f ${BasePath}/cljrepl.service /etc/systemd/system/
    systemctl enable cljrepl.service
    systemctl start cljrepl.service
}

main () {
    echo "PROVISIONING"

    export DEBIAN_FRONTEND=noninteractive

    # Update apt cache
    apt-get update
    apt-get autoclean
    apt-get autoremove -y

    # Install some base software
    apt-get install -y curl vim

    # Create bin dir for user vagrant
    mkdir -p /home/vagrant/bin
    chown vagrant:vagrant /home/vagrant/bin

    # Navigate to project directory on login
    echo "cd ${BasePath}" >> /home/vagrant/.bashrc

    # Add greeting
    echo "Hello 💧 Lemming :)" > /etc/motd

    clojure
}
main
