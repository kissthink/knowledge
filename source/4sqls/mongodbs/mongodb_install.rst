.. _mongodb_install:

MongoDB的安装
#######################

::

    sudo apt-get install mongodb   (unbunt下有问题,建议源码安装)




`官方 <http://www.mongodb.org/>`_ 下载, 源码安装

or

MongoDB yum 源配置内容::

    //我们这里就将该文件命名为：
    /etc/yum.repos.d/10gen.repo
  
    //For 64-bit yum源配置:
    cat << EOF > /etc/yum.repos.d/10gen.repo

    [10gen]  
    name=10gen Repository  
    baseurl=http://downloads-distro.mongodb.org/repo/redhat/os/x86_64  
    gpgcheck=0

    //For 32-bit yum源配置:
    cat << EOF > /etc/yum.repos.d/10gen.repo  

    [10gen]  
    name=10gen Repository  
    baseurl=http://downloads-distro.mongodb.org/repo/redhat/os/i686  
    gpgcheck=0  


