.. _mysql_install:

MySQL安装[待废弃]
================================

::

    tar zxvf cmake-2.8.7.tar.gz
    cd cmake-2.8.7
    ./configure --prefix=/usr/local/cmake
    make
    make install

安装mysql-5.5.16
-------------------------

安装mysql::

    tar zxvf mysql-5.5.16.tar.gz
    cd mysql-5.5.16
    /usr/local/cmake/bin/cmake . -DCMAKE_INSTALL_PREFIX=/usr/local/mysql
    make
    make install

    cd /usr/local/bin
    ln -s ../mysql/bin/mysql .
    ln -s ../mysql/bin/mysqld .
    ln -s ../mysql/bin/mysqldump .
    ln -s ../mysql/bin/mysqladmin .
    ln -s ../mysql/bin/mysqld_safe .

初使化数据
----------------

必选命令::

    cd /usr/local/mysql
    chown -R mysql .
    chgrp -R mysql .
    ./scripts/mysql_install_db --user=mysql
    chown -R root .
    chown -R mysql data

启动mysql服务::

    [root@www mysql]# /usr/local/mysql-5.5.21/bin/mysqld 
        --basedir=/usr/local/mysql-5.5.21/ --datadir=/data/mysql/3307/data/ 
        --plugin-dir=/usr/local/mysql-5.5.21/lib/plugin/ --user=mysql 
        --log-error=/data/mysql/3307/log/error.log 
        --pid-file=/usr/local/mysql-5.5.21/data/mysql.pid 
        --socket=/tmp/my.sock --port=3307


可选命令::

    cp support-files/my-medium.cnf /etc/my.cnf
    bin/mysqld_safe --user=mysql &

    cp support-files/mysql.server /etc/init.d/mysql.server

给超级用户設定密码::

    ./bin/mysqladmin -u root password 'new-password'
    or
    ./bin/mysqladmin -u root -h <hostname> password 'new-password'

其他:
删除默认的匿名用户,基于安全考虑,工业上推荐执行这个命令::

    ./bin/mysql_secure_installation



重新安装
------------

命令::

    make clean
    rm CMakeCache.txt



其他注意事項
----------------------

cmake使用选项::

    -DBUILD_CONFIG=mysql_release: Configure the source with the same build options 
          used by Oracle to produce binary distributions for official MySQL releases!
    -DCMAKE_INSTALL_PREFIX=dir_name: 指定mysql的安装目录
    -DCPACK_MONOLITHIC_INSTALL=1: 使用<make package>命令来生成的多个文件打包成单个文件
    -DWITH_DEBUG=1: 增加debugging的支持

詳細请查看: `MySql源配置选项 <http://dev.mysql.com/doc/refman/5.5/en/source-configuration-options.html#option_cmake_build_config>`_

