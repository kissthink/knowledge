.. _emacs_command_digit:

数字参数
===========

* Ctrl+u 向命令传递参数 ``C-u (#) command, C-u (#) M-x <universal-argument>``
* 实例(向前10个字符)::

    C-u 10 C-f
    C-u 10 M-x forward-char

* 不理解::

    M-(#) (command)
    negative-argument （负参数）
    M-[1-9] 快速参数
    digit-argument （数字参数）
