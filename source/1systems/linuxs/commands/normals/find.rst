.. _find:

find命令使用
==================
::

    find [路径] <表达式>

* 查找文件::

      -name <表达式> 根据文件名查找文件
      -perm mode,[-mode],[/mode],[+mode]
      -printf <format>
      -iname <表达式> 根据文件名查找文件,忽略大小写
      -path <表达式> 根据路径查找文件
      -ipath <表达式> 根据路径查找文件,忽略大小写
      -amin <分钟> 过去 N 分钟内访问过的文件
      -atime <天数> 过去 N 天内访问过的文件
      -cmin <分钟> 过去 N 分钟内修改过的文件
      -ctime <天数> 过去 N 天内修改过的文件
      -anewer <参照文件> 比参照文件更晚被读取过的文件
      -cnewer <参照文件> 比参照文件更晚被修改过的文件
      -size <大小> 根据文件大小查找文件,单位 b c w k M G
      -type <文件类型> 根据文件类型查找文件。b 块设备 c 字符设备 d 目录 p 管道文件 f 普通文件 l 链接 s 端口文件
      -user <用户名> 按归属用户查找文件
      -uid <uid> 按 UID 查找文件
      -group <群组名> 按归属群组查找文件
      -gid <gid> 按 GID 查找文件
      -empty 查找空文件




* 实例::

    find . -perm 664
    find . -perm -664

    //找
    find . -perm /220
    find . -perm /u+w,g+w
    find . -perm /u=w,g=w

    //找可被ower和group写的
    find . -perm -220
    find . -perm -g+w,u+w



