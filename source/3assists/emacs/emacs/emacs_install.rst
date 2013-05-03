.. _emacs_install:

emacs安装
#################

源码安装
-----------------
* centos::

    sudo yum install libXpm libXpm-devel libtiff libtiff-devel giflib giflib-devel 

* 去网站 http://www.gnu.org/s/emacs 得到下载包
* 标准安装::

    ./configure --prefix=/usr/local/emacs-<version>
    make
    sudo make install


yum安装
----------------

* repo: http://puias.princeton.edu/data/puias/unsupported/5.7/x86_64/


* 新建文件 ``/etc/yum.repos.d/puias-unsupported.repo``::

    [puias-unsupported]
    name=PUIAS Unsupported
    baseurl=http://puias.math.ias.edu/data/puias/unsupported/5/x86_64/
    enabled=1
    gpgcheck=0

* yum安装::

    sudo yum install emacs23
    sudo yum --disablerepo=”*” --enablerepo=puias-unsupported install emacs23


* 注:

If you install it this way, it will be placed into /usr/emacs23/ . It does not replace the existing emacs21

