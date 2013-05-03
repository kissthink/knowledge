.. _emacs_command_region:

区块编辑
=============
* 如图::

    ---XXXXXxxx
    xxxXXXXXxxx
    xxxXXXXXxxx
    xxxXXXXX---

* **连续区块** 为标记和光标点之间连续的区块；字符 X 和 x 均为连续区块
* **矩形区块** 为标记和光标点之间矩形的区块；大写字符 X 为矩形区块

连续区块
''''''''''''''''
* 在光标点处设置标记 ``C-SPC/C-@ (M-x set-mark-command)``
* 在单词结尾处设置标记 ``M-@ (M-x set-mark-word)``
* 选中段落 ``M-h (M-x mark-paragraph)``
* 在句末设置标记 ``(M-x mark-end-of-sentence)``
* 整个缓冲区 ``C-x h (M-x mark-whole-buffer)``
* 交换标记和光标点 ``C-x C-x (M-x exchange-point-and-mark)``

矩形区块
'''''''''''''''
* 删除矩形区块 ``C-x r k (M-x kill-rectangle)``
* 粘贴上一次删除的矩形区块 ``C-x r y (M-x yank-rectangle)``
* 用指定字符填充 ``C-x r t (M-x string-rectangle)``
* 用空格插入 ``C-x r o (M-x open-rectangle)``
* 用空格填充 ``C-x r c (M-x clear-rectangle)``
* 拷贝到寄存器中 ``C-x r r (M-x copy-rectangle-to-register)``

