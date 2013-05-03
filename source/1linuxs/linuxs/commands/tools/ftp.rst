.. _ftp:

ftp命令使用
#####################

启动FTP服务器::

    service vsftpd start

::

   默认的ftp服务器目录: /var/ftp/pub
   匿名身份用户: anonymous
   ftp配置文件: /etc/vsftpd/vsftpd.conf

基本命令::

    ftp <ip> <port>
    mget <fileName>
    put <fileName>


