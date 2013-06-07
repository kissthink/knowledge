.. _emacs_command_other:

其它
========

* 插入控制字符 ``C-q <control chars>``, 实例::

    C-q C-m = ^M

* 文本换位::

    字符    C-t         M-x transpose-chars
    单词    M-t         M-x transpose-words
    行      C-x C-t     M-x transpose-lines

* 将TAB 字符转换为空格, ``选中需要转换的区域 (M-x untabify)``
* 对齐文本块, ``选中需要对齐的区域 (M-x indent-region)``

* Shell 模式 ``(M-x shell)``
* 服务器模式:

    * 启动一个 Emacs 的守护进程::

        emacs --daemon

    * 然后通过 emacsclient 来连接服务器::

        emacsclient  -t  --alternate-editor jed  file

    * **-t** 在当前控制台打开 emacs 窗口
    * **--alternate-editor jed** 如果不能连接到 emacs 服务器, 则使用 jed 编辑器

* 也可以使用 Emacs 服务器模式，M-x server-start 或者在配置文件中添加 (server-start) 启用 Emacs 服务器，使用 emacs-client 连接
