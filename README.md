# Clojure Setup (Vagrant)

This is a simple Clojure environment using Vagrant.

## Setup Requirements

Download and install the following tools.

* VirtualBox 5.1.x (https://www.virtualbox.org/wiki/Downloads)
* Vagrant 1.9.x (https://www.vagrantup.com/downloads.html)

## Setup Guide on Medium

https://medium.com/lemmings/clojure-and-atom-editor-setup-40f8f09237b4

## Usage

`vagrant up` starts the virtual machine. The command will also provision the environment if it is executed for the first time.

`vagrant ssh` starts an ssh session to the virtual machine

Once you are sshed into the virtual machine you can start a leiningen REPL on port 7888 `lein repl :headless :host 0.0.0.0 :port 7888`. Thanks to the Vagrant setup this port is already forwarded to the host machine. You can now connect to your Clojure REPL running within the virtual machine (e.g. with Atom's [proto-repl]("https://atom.io/packages/proto-repl") package).
