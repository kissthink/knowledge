
Python包管理工具
#############################

包管理工具有easy_install, setuptools; pip,distribute, 这几个工具的关系

.. figure:: img/python_packet_tool.png
   :width:  60%

安装Distribute
--------------------
* Distribute是对标准库disutils模块的增强，我们知道disutils主要是用来更加容易的打包和分发包，特别是对其他的包有依赖的包
* Distribute被创建是因为Setuptools包不再维护了


* 通过easy_install, pip来安装
* 通过源文件来安装
* 不过使用distribute_setup.py来安装是最简单和受欢迎的方式::

    $ curl -0 http://python-distribute.org/distribute_setup.py
    $ sudo python distribute_setup.py


安装Pip
--------------

* ``Pip`` 是安装python包的工具, 提供了安装包, 列出已经安装的包, 升级包以及卸载包的功能
* ``Pip`` 是对 ``easy_install`` 的取代, 提供了和easy_install相同的查找包的功能, 因此可以使用easy_install安装的包也同样可以使用pip进行安装


* 通过easy_install来安装::

    $ easy_install pip

* get_pip.py 脚本安装::

    $ curl -0 https://raw.github.com/pypa/pip/master/contrib/get-pip.py
    $ sudo python get-pip.py

* 通过源文件来安装::

    $ wget http://pypi.python.org/packages/source/p/pip/<pip-0.7.2>.tar.gz  # 替换为最新的包
    $ tar xzf pip-0.7.2.tar.gz
    $ cd pip-0.7.2
    $ python setup.py install


Pip的使用
--------------

* 安装package::

    $ pip install Markdown

* 列出安装的packages::

    $ pip freeze

* 安装特定版本的package::

    通过使用==, >=, <=, >, <来指定一个版本号
    $ pip install 'Markdown<2.0'
    $ pip install 'Markdown>2.0,<2.0.3'

* 升级包::

    升级包到当前最新的版本，可以使用-U 或者 --upgrade
    $ pip install -U Markdown

* 卸载包::

    $ pip uninstall Markdown

* 查询包::

    $ pip search "Markdown"


PS -- 包安装后的py文件路径：/usr/local/lib/python2.7/dist-packages

