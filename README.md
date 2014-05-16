obm-unattended-installer
========================

This project aims at providing Vagrant + Ansible recipes to build OBM instances.
Then another machine named "injector" can be created to benchmark the built instance.

Required dependencies
========================

* vagrant 1.6
* ansible 1.1
* docker 0.9
* a 64 bits computer

Required configuration
========================

Search for the "docker.create_args" entries into the Vagrantfile and replace the value by yours DNS's IP.

How to use it ?
========================

## Install OBM
It's usual vagrant stuff : just fetch the source code and run 
`vagrant up --provider=docker obm`, take a coffee break, and you get a fresh OBM instance running.

You can then connect to it with `vagrant ssh obm -c bash`
The IP address can also be found with `docker inspect OBM|grep IP`

## Configure OBM
  * Create a host, then a domain
  * Modify the "admin" role to give full control of every domains
  * Create an user with the "admin" role on the new domain
  * Connect OBM with this new admin user
  * Create users used for the benchmark by importing "import_users.csv", don't forget to run the automate
  * Install the opush schema in Cassandra with the CRaSH console then restart opush
  * You can create a docker image to restore it between each benchmark: 
          `docker commit -m "Ready for benchmark" OBM obm-full:3.0.0-benchmark`

## Configure your benchmark by editing the ./Debian/injector.yml
  * set the created OBM domain at --user-domain
  * set --duration and --duration-unit
  * set a scenario to run

## Install and run a benchmark
Create the docker machine and run the benchmark with `vagrant up --provider=docker injector`.
Result report is located at "/root/results/" on the injector machine.

## Rerun a benchmark
Run `vagrant provision injector`

