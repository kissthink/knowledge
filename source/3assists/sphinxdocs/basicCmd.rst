.. _commoncmd:

基本格式查询
=================

.. _header_1:

    * 链接

        `链接显示名 <http://blog.programfan.info/>`_

    * 站内链接

        :ref:`链接显示，右面是文件开头的索引 <header_1>`

    * 图片

        * 代码::

            .. figure:: image/photo.jpg
               :width: 20%

        * 显示:

            .. figure:: image/photo.jpg
               :width: 20%

        * 选项::

           :width: 12.0cm
           :width: 20%

    * 注释::

        .. -*- coding:utf-8 -*-

    * 代码格式

        ``usage.rst``

    * 代码段格式::

          msgfmt "usage.po" -o "translated/es/LC_MESSAGES/usage.mo"

    * 列表格式
         1,  
            * 这是一个符号列表
            * 它有两项，其中第
              二行占两行

         2,
            1. 这是一个编号列表
            2. 它也只有两项(只占一行)

         3,
            #. 这是一个(自动的)编号列表
            #. 它也有两行


    * 黑体
         **binary catalogs**
    * 斜体(italics)
         *text*

    * 变颜色::

        :unsure:`文本`

    * 章节::

        =================
        This is a heading
        =================
        //以下是其他章节说明
        # with overline, for parts
        * with overline, for chapters
        =, for sections
        -, for subsections
        ^, for subsubsections
        ", for paragraphs
 
    * 脚注:

        使用处語法::

            \ [#] \
            or
            \ [1] \

        脚注说明::

            .. rubric:: 脚注

            .. [#] 具体说明


    * 包含(包含另一个reStructuredText文件)::

        .. include:: path/to/file.rst

    * 包含代码文件:

        * 实例一::

           .. literalinclude:: /path/to/file.erl
               :language: erlang
               :emphasize-lines: 12,15-18  //亮显
               :linenos: //显示行号
           
        * language选项::

            erlang
            php
            matlab
            sh
            ruby            


        * emphasize-lines::

            12, 13, 14
            12-14
            12-

        * encoding::

            latin-1



配置文件选项类型
""""""""""""""""""""""


.. program:: sphinx-apidoc

.. option:: -o outputdir

   这儿写此选项的一些介绍



