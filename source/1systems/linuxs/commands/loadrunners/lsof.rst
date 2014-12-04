lsof命令
================
一个列出当前系统打开文件的工具
http://people.freebsd.org/~abe/

::

   // 列表使用此文件的进程
   lsof /path/to/file

   // 递归查找某个目录中所有打开的文件
   lsof +D /usr/lib

   // 递归查找某个目录中所有打开的文件
   lsof +D /usr/lib
   lsof | grep ‘/usr/lib’// 这个反应快

   // 列出某个用户打开的所有文件
   lsof -u pkrumins
   lsof -u rms,root

   // 查找某个程序打开的所有文件
   lsof -c apache   //-c选项限定只列出以apache开头的进程打开的文件
   lsof -c apache -c python   // 列出所有由apache和python打开的文件

   //列出除root用户外的所有用户打开的文件
   lsof -u ^root

   // 列出所有由某个PID对应的进程打开的文件
   lsof -p <pid>
   lsof -p <pid1>,<pid2>,<pid3>

   lsof -p ^1   // 取反

   // 列出网络连接
   lsof -i   // 全部
   lsof -i tcp
   lsof -i :25   // 找到使用某个端口的进程
   lsof -i :smtp
   lsof -i udp:53

   //列出所有UNIX域Socket文件
   lsof -U   // -U就对应UNIX

   // 输出使用某些资源的进程pid
   lsof -t -i
   
   // 循环列出文件
   lsof -r 1



