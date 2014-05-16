# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  config.vm.define "obm" do |vagrant|
    vagrant.vm.hostname = "obm"
    vagrant.ssh.username = "root"
    vagrant.ssh.port = 22
    vagrant.vm.provider "docker" do |docker|
      docker.build_dir = "wheezy-docker"
      docker.name = "OBM"
      docker.cmd = ["/sbin/init"]
      docker.create_args = ["--dns", "10.69.255.254"]
      docker.has_ssh = true
      docker.expose = ["443"]
    end

    vagrant.vm.provision "file" do |file|
      file.source = "apt-preferences"
      file.destination= "/etc/apt/apt.conf"
    end

    vagrant.vm.provision "ansible" do |ansible|
      ansible.playbook = "Debian/obm.yml"
      ansible.verbose = "vvvv"
    end
  end


  config.vm.define "injector" do |vagrant|
    vagrant.vm.hostname = "injector"
    vagrant.ssh.username = "root"
    vagrant.ssh.port = 22
    vagrant.vm.provider "docker" do |docker|
      docker.build_dir = "wheezy-docker"
      docker.name = "injector"
      docker.cmd = ["/sbin/init"]
      docker.create_args = ["--dns", "10.69.255.254"]
      docker.has_ssh = true
      docker.link "OBM:OBM"
    end

    vagrant.vm.provision "file" do |file|
      file.source = "apt-preferences"
      file.destination= "/etc/apt/apt.conf"
    end

    vagrant.vm.provision "ansible" do |ansible|
      ansible.playbook = "Debian/injector.yml"
      ansible.verbose = "vvvv"
      unless (ENV['OBM_DOMAIN'].nil?)
        ansible.extra_vars = {domain: ENV['OBM_DOMAIN']}
      end
    end
  end



end
