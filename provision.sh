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
}

heroku () {
  # Install Heroku CLI
  apt-get install software-properties-common -y # debian only
  add-apt-repository "deb https://cli-assets.heroku.com/branches/stable/apt ./"
  curl -L https://cli-assets.heroku.com/apt/release.key | apt-key add -
  apt-get update
  apt-get install heroku -y
}

ngrok () {
  # Install ngrok
  wget -q -O /home/vagrant/ngrok.zip https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-amd64.zip
  unzip /home/vagrant/ngrok.zip
  mv /home/vagrant/ngrok /home/vagrant/bin/ngrok
  chmod a+x /home/vagrant/bin/ngrok
  chown vagrant:vagrant /home/vagrant/bin/ngrok
  rm /home/vagrant/ngrok.zip

  mkdir -p /home/vagrant/.ngrok2
  cp -f ${BasePath}/ngrok.yml /home/vagrant/.ngrok2/
  chmod -R a+x /home/vagrant/.ngrok2
  chown -R vagrant:vagrant /home/vagrant/.ngrok2
}

main () {
    echo "PROVISIONING"

    export DEBIAN_FRONTEND=noninteractive

    # Update apt cache
    apt-get update
    apt-get autoclean
    apt-get autoremove -y

    # Install some base software
    apt-get install -y curl vim unzip

    # Create bin dir for user vagrant
    mkdir -p /home/vagrant/bin
    chown vagrant:vagrant /home/vagrant/bin

    # Navigate to project directory on login
    LINE="cd ${BasePath}"
    FILE=/home/vagrant/.bashrc
    grep -q "$LINE" "$FILE" || echo "$LINE" >> "$FILE"

    # Add greeting
    echo "Hello 💧 Lemming :)" > /etc/motd

    clojure
    heroku
    ngrok
}
main
