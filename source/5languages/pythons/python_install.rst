.. _python_install:

python安装
#######################

* 官网: http://www.python.org/
* 文档: http://docs.python.org/



<<<<<<< HEAD

安装高版本的python后，会遇到一些问题:



1.要把/usr/bin下面的python改成新版本的python; 但这会导致一个问题——yum的使用

2. 因为yum默认的是使用python2.4,为了使yum命令能正确执行,需要修改
[root@CNC-BJ-5-3N1 bin]# vi yum
将#!/usr/bin/python 改为 #!/usr/bin/python2.4

3. 原来用easy_install安装的包都需要重新安装
4. 遇到这个总是 ``ImportError: No module named pkg_resources`` , 解决方案::

    curl -O http://python-distribute.org/distribute_setup.py
    python distribute_setup.py

5. ``ImportError: No module named Image``错误解决
到　`这儿Python Imaging Library (PIL) <http://www.pythonware.com/products/pil/>`_ 下载Images安装::

    python setup.py install




=======
::

    easy_install web.py

    easy_install pymongo

    easy_install mysql-python


    sudo easy_install -U distribute  # 不知道干什么用的,但我在安装mysql-python时,让我先安装这个才行
>>>>>>> 00cb187f5f85b304f3f83fcf2001a2c0a5bc695b
