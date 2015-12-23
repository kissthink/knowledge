.. _emacs_install:

emacs安装
#################


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

