.. _emacs_command_core:

emacs内部命令
====================

查询内部命令
'''''''''''''''

* 查询键盘操作绑定的命令 ``C-h k <你输入键盘操作>``
* 以简洁模式查询键盘操作绑定的命令 ``C-h c  <你输入键盘操作>``

Emacs 终端
'''''''''''''
* 激活 Emacs 终端, 可以在 Emacs 终端中使用外部命令::

    M-x shell

* 临时执行一条外部命令, 并输出在名为 *Shell Command Output* 的缓冲区中::

    M-!

* 临时执行一条外部命令, 并输出到光标位置::

    C-u M-! 

中止执行
'''''''''''
* ``C-g (M-x keyboard-quit)``
* ``ESC ESC ESC (M-x keyboard-escape-quit)``
