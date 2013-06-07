.. _emacs_command_basic:

基本操作
==============

* 保存退出 ``C-x C-c (M-x save-buffers-kill-emacs)``
* 挂起(最小化) ``C-x C-z (M-x iconify-or-deiconify-frame)``
* 打开文件、目录 ``C-x C-f (M-x find-file)``::

    /host:filename  
    /user@host:filename  
    /user@host#port:filename  
    /method:user@host:filename  
    /method:user@host#port:filename  

    * method可以是: ftp,ssh,rlogin,telnet等可以远程登录的程序, 其缺省的是 
    * 如果主机名称以"ftp."开始，那就用ftp
    * 如果用户名称是ftp或者anonymous，那也用ftp
    * 其余的缺省是ssh

* 以只读模式打开 ``C-x C-r (M-x find-file-read-only)``
* 插入文件内容 ``C-x i M-x insert-file``
* 保存 ``C-x C-s (M-x save-buffer)``
* 询问, 保存所有未保存的缓冲区 ``C-x s  (M-x save-some-buffers)``
* 另存为文件 ``C-x C-w (M-x write-file)``
* 以指定编码读取文件 ``C-x RET r  (M-x revert-buffer-with-coding-system)``
* 以指定编码保存文件 ``C-x RET f  (M-x set-buffer-file-coding-system)``
* 恢复到原始状态 ``(M-x revert-buffer)``

