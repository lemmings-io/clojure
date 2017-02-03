# Clojure Setup (Vagrant)

This is a simple Clojure environment using Vagrant.

## Setup Requirements

Download and install the following tools.

* VirtualBox 5.1.x (https://www.virtualbox.org/wiki/Downloads)
* Vagrant 1.9.x (https://www.vagrantup.com/downloads.html)

## Setup Guide on Medium

https://lemmings.io/clojure-and-atom-editor-setup-40f8f09237b4

## Vagrant Usage

`vagrant up` starts the virtual machine. The command will also provision the environment if it is executed for the first time.

`vagrant ssh` starts an ssh session to the virtual machine

## Clojure Remote nREPL Usage

Once you are `ssh`ed into the virtual machine the nREPL is running and you can connect to it in Atom by pressing `CMD+ALT+Y` with `localhost` and port `7888`. Make sure you have Atom's [proto-repl]("https://atom.io/packages/proto-repl") package installed.
