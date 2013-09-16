vagrant命令
#################

site: http://www.vagrantup.com


简单命令::

    vagrant add <title> <url.box>
    vagrant init <title>     # 其实就是生成Vagrantfile的过程
    vagrant up     # 启动vagrant对应的虚拟机
    vagrant ssh    # 连接虚拟机


共享目录::

    /vagrant     # 默认在虚拟机下的共享目录

Box命令::

    vagrant box add
    vagrant box list
    vagrant box remove
    vagrant box repackage


个性化实例 ``Vagrantfile`` ::

    # -*- mode: ruby -*-
    # vi: set ft=ruby :

    # Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
    VAGRANTFILE_API_VERSION = "2"

    Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

      config.vm.define :app1 do |app|
        app.vm.provider "virtualbox" do |v|
          v.customize ["modifyvm", :id, "--name", "app1"]
        end
        app.vm.guest = :freebsd
        app.vm.box = "app"
        app.ssh.username = "root"
        app.ssh.guest_port = 22
        app.ssh.timeout = 100
        app.ssh.host = "118.194.167.99"
        app.ssh.shell = "sh"
        app.vm.hostname = "app1"
        app.vm.network :forwarded_port,guest: 22, host: 22001, host_ip: "118.194.167.99", id: "ssh"
        app.vm.network :public_network,:bridge => "bce0",:type => :static, ip: "192.168.1.20",netmask: "255.255.255.0"
        app.vm.synced_folder "vagrant", "/vagrant", disabled: true
      end
    end





