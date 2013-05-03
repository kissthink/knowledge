.. _temp:

linux命令
============

1. 察看glibc版本号:
    dpkg-query -l glibc*
2. 如何更改环境变量PATH的值:
    编辑 `` ~/.bash_profile`` 或者 `` ~/.bashrc`` 文件，找到 **PATH** 环境变量,如果找不到增加如下一行::

        export PATH=${PATH}:path1:path2...

3. tmp
    * sudo dpkg-reconfigure tzdata.来修改时区
    * curl ...
    * sudo apt-get install scim-tables-zh：五笔安装[未成功]
    * rsync数据同步

