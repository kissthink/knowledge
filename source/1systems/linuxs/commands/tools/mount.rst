.. _mount:

mount命令使用
===================
:作用: 挂载文件系统
:方法:

    mount <设备文件> [挂载路径]

.. option:: -t 

   指定文件系统的类型。通常不必指定,mount 自动检测。下面是常用的格式::

                   reiserfs      ReiserFS 3.6 版
                   jfs           IBM 技术
                   xfs           SGI 技术(适合高级服务器,桌面用户慎用)
                   ext3          Linux 传统文件系统
                   vfat          fat fat32
                   ext2          不带日志的 ext3
                   ntfs          WINNT
                   iso9660       光盘
                   smbfs         Windows 文件共享

.. option:: -o [选项 1] [选项 2] ……

   ::

                   loop              环设备。光盘、ISO镜像等
                   ro | rw           只读 readonly;可读写 read-write
                   sync | async      同步模式|异步模式。决定修改是否立即写入文件系统
                   atime | noattime 读取时是否修改访问时间。对于写入敏感设备,例如闪存、 软盘,建议使用 *noatime*
                   auto | noauto     自动挂载模式
                   exec | noexec     是否允许可执行权限
                   defaults           使用预设的选项 rw,
                   suid, dev, exec, auto, nouser, async
                   iocharset=UTF-8   指定字符集,可简写为 utf8
                   codepage=936 指定代码页,可简写为 cp936 西文系统代码页为 437
                   umask=<权限掩码> 设定权限掩码
                   uid=<UID>    设定归属用户
                   gid=<GID>    设定归属群组
                   remount      以不同选项重新挂载

.. option:: -L <卷标>

    将带有特殊卷标的分区
