.. _emacs_command:

emacs命令列表
####################


* 另存到一个指定的文件，使用 ``C-x C-w``
* 所有被删除的内容会进入一个称为删除环的地方，按 ``C-y`` 就可以把它粘贴到光标所在的位置, 如果想要取再 **前一次** 的删除数据, 就在 ``C-y`` 之后(不要做其它操作) 继续按 ``M-y``,重复按 ``M-y`` 可以遍历整个删除环
* 关闭缓冲区: ``C-x C-k``
* 交换光标所在字符及其前一个字符的位置 ``C-t``
* 代码自动完成 ``M-/``
* 对当前选区重排 ``C-M-\``

.. toctree::
   :maxdepth: 2

   commands/emacs_command_core
   commands/emacs_command_help
   commands/emacs_command_basic
   commands/emacs_command_digit
   commands/emacs_command_edit
   commands/emacs_command_region
   commands/emacs_command_window
   commands/emacs_command_other
   commands/emacs_command_register
   commands/emacs_command_bookmark
   commands/emacs_command_macro
   commands/emacs_command_outline
   commands/emacs_command_file
   commands/emacs_command_search
   commands/emacs_command_sdcv



常见编程语言支持
==================

* ``M-x <语言>-mode``, 其中语言有(关键字 ``Emacs 语言 mode``)::

    erlang
    sh

    rst
    emacs-lisp

    php
    python
    perl
    

命令使用列表
===============
::

    C-       按住 Ctrl键
    M-       按住 Meta键, 在 PC 上, Meta键, 通常对应 Alt 键
    C-M-     同时按住 Ctrl键 和 Meta键
    S-       Shift键
    s-       Linux 下对应 WIN 键
    RET      回车键
    TAB      Tab键
    ESC      Esc键
    SPC      空格键
    DEL      退格键
    Delete   删除键


