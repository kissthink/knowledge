.. _lsattr:

lsattr命令使用
==================
::

    lsattr [路径]

查看文件的特殊属性::

      -a 全部显示
      -d 只显示目录
      -R 递归
      特殊属性包括:
      a:仅供附加用途
      b:不更新最后存取时间
      c:压缩后存放
      d:排除在倾倒操作之外
      i:不得任意更动文件或目录
      s:保密性删除文件或目录
      S:即时更新文件或目录
      u:预防以外删除

::

    chattr  +|-|=<属性> <路径>

更改文件特殊属性::

      -R 递归
      -V 显示过程

