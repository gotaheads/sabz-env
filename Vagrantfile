# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
$init = <<SCRIPT
#sudo /home/vagrant/android-sdk-linux/platform-tools/adb kill-server
#sudo /home/vagrant/android-sdk-linux/platform-tools/adb start-server
#sudo /home/vagrant/android-sdk-linux/platform-tools/adb devices
SCRIPT

Vagrant.configure(2) do |config|
  # The most common configuration options are documented and commented below.
  # For a complete reference, please see the online documentation at
  # https://docs.vagrantup.com.

  # Every Vagrant development environment requires a box. You can search for
  # boxes at https://atlas.hashicorp.com/search.
  config.vm.box = "ubuntu/trusty64"
  config.vm.hostname = "sabz-u14"

  config.vm.provision :shell, path: "bootstrap.sh"
  config.vm.provision :shell, path: "install-docker.sh"
  config.vm.provision :shell, run: "always", inline: $init

  #nginx
  config.vm.network :forwarded_port, host: 8000, guest: 80

  config.ssh.forward_agent = true

  config.vm.provider :virtualbox do |vb|
  #   # Don't boot with headless mode
     #vb.gui = true
     #Use VBoxManage to customize the VM. For example to change memory:
     #vb.customize ["modifyvm", :id, "--usb", "on"]
     vb.customize ["modifyvm", :id, "--memory", "1582"]
     #vb.customize ["usbfilter", "add", "0", "--target", :id, "--name", "android", "--vendorid", "0x18d1"]
     #vb.customize ["usbfilter", "add", "0", "--target", :id, "--name", "androidSamsung", "--vendorid", "0x04e8"]
  end

  module OS
      def OS.windows?
          (/cygwin|mswin|mingw|bccwin|wince|emx/ =~ RUBY_PLATFORM) != nil
      end

      def OS.mac?
          (/darwin/ =~ RUBY_PLATFORM) != nil
      end

      def OS.unix?
          !OS.windows?
      end

      def OS.linux?
          OS.unix? and not OS.mac?
      end
  end

  if OS.windows?
    Vagrant.configure("2") do |config|
      config.vm.synced_folder ".", "/vagrant", type: "rsync",
        rsync__exclude: ".git/"
    end
  end

  config.vm.provider "docker" do |d|
      d.has_ssh = true
      d.build_dir = "."
      d.force_host_vm = true
  end

  # Disable automatic box update checking. If you disable this, then
  # boxes will only be checked for updates when the user runs
  # `vagrant box outdated`. This is not recommended.
  # config.vm.box_check_update = false


  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  # config.vm.network "private_network", ip: "192.168.33.10"

  # Create a public network, which generally matched to bridged network.
  # Bridged networks make the machine appear as another physical device on
  # your network.
  # config.vm.network "public_network"

  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.
  # config.vm.synced_folder "../data", "/vagrant_data"

  # Provider-specific configuration so you can fine-tune various
  # backing providers for Vagrant. These expose provider-specific options.
  # Example for VirtualBox:
  #
  # config.vm.provider "virtualbox" do |vb|
  #   # Display the VirtualBox GUI when booting the machine
  #   vb.gui = true
  #
  #   # Customize the amount of memory on the VM:
  #   vb.memory = "1024"
  # end
  #
  # View the documentation for the provider you are using for more
  # information on available options.

  # Define a Vagrant Push strategy for pushing to Atlas. Other push strategies
  # such as FTP and Heroku are also available. See the documentation at
  # https://docs.vagrantup.com/v2/push/atlas.html for more information.
  # config.push.define "atlas" do |push|
  #   push.app = "YOUR_ATLAS_USERNAME/YOUR_APPLICATION_NAME"
  # end

  # Enable provisioning with a shell script. Additional provisioners such as
  # Puppet, Chef, Ansible, Salt, and Docker are also available. Please see the
  # documentation for more information about their specific syntax and use.
  # config.vm.provision "shell", inline: <<-SHELL
  #   sudo apt-get update
  #   sudo apt-get install -y apache2
  # SHELL
end
