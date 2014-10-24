.. _exec:

exec命令
###############

  




实例(linux下实例, mac下不适用)
==================================

* 在当前目录下(包含子目录)，查找所有txt文件并找出含有字符串"bin"的行::

    find ./ -name "*.txt" -exec grep "bin" {} \;

* 在当前目录下(包含子目录)，删除所有txt文件::

    find ./ -name "*.txt" -exec rm {} \;

* 把目录folder下(包含子目录)的html文件打包::

    find <folder>/ -name "*.html" -type f -exec tar zcvf <abc>.tar.gz {} \;

* 把目录folder下(包含子目录)的html文件拷贝到文件夹folder2中::

    find <folder>/ -name "*.html" -type f -exec cp {} <folder2>/ \;

* 把当前目录下(包含子目录)的文件中的 ``($session[0]['id']`` 修改为 ``($session[0]['user_id']``::

    find . -type f -exec sed -i "s/(\$session\[0]\['id']/(\$session\[0]\['user_id']/g" {} \;











