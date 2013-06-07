.. _emacs_command_edit:

基础编辑
============

定位
''''''
* 前进后退什么的就略了
* 按段落前进、后退 ``M-{    M-}``
* 按指定行数前进、后退 ``M-g g    M-g M-g``
* 按行号跳转 ``M-x goto-line``
* 按字符数跳转 ``M-x goto-char``

增删改查(kill<剪切>, delete<删除>)
'''''''''''''''''''''''''''''''''''''''
* 删除前面字符 ``C-d (M-x delete-char)``
* 删除后面字符 ``DEL (M-x delete-backward-char)``
* 删除前面单词 ``M-d (M-x kill-word)``
* 删除后面单词 ``C-Delete / M-DEL (M-x backward-kill-word)``
* 剪切光标至行末 ``C-k  (M-x kill-line)``
* 剪切整行 ``C-S-backspace   (M-x kill-whole-line)``
* 按表达式删除 ``C-M-k    (M-x kill-sexp)``
* 剪切区块 ``C-w   (M-x kill-region)``
* 删除连续空格 ``(M-x delete-horizontal-space)``
* 复制 ``M-w (M-x kill-ring-save)``
* 粘贴 ``C-y (M-x yank)``
* 粘贴之前的 ``M-y (M-x yank-pop)`` (和上面命令联合使用)
* 撤消之前的修改 ``C-/ (M-x undo)``
* 撤消之前的修改 ``C-_ (M-x undo)``
* 撤消之前的修改 ``C-x u (M-x advertised-undo)``
* 重做(安装 redo.el 扩展,并在配置文件中添加如下内容)::

    ;; 读取扩展
    (require 'redo)
    ;; 设置 Redo 的键绑定
    (global-set-key ( kbd "C-.") 'redo)
