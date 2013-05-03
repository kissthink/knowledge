.. _git_log:

浏览日志 git log
#########################

显示完整补丁
================
::

    git log -p


显示统计补丁
=================
::

    git log --stat

调整显示格式
==================
* <format>格式有oneline，short，medium，full，fuller，email，raw::

    git log --pretty=<format>

自定义格式
==================
* 命令::

    git log --pretty=format:"<format>"

* 实例::

    git log --pretty=format:"The author of %h was %an, %ar%nThe title was >>%s<<%n"


分枝拓扑图
==============
::

     git log --pretty=oneline --graph

日期区间
=================

* git log'命令后如果跟-before和-after选项，就会显示两个日期之间的提交条目::

    git log --before="2 weeks ago" --after="2009-01-26" --pretty=oneline


贡献者过滤器
=====================

* 查找作者名（author）为Gordon，在过去两周内的所有提交条目::

    git log --author=Gordon --since="14 days ago" --pretty=oneline

* 查找作者名为Gordon提交的补丁数对应的email列表::

    git log --author=Gordon --pretty=format:"%ae"

* 查找作者名为Gordon提交的补丁数::

    git log --author=Gordon --pretty=format:"%ae" | wc -l

* 在大型开源项目中一个author有多个作者, 如下源码项目有113个gmail账户的作者贡献的1348个补丁::

    $ git log --author=gmail --pretty=format:"%ae" | wc -l
     1348
    $ git log --author=gmail --pretty=format:"%ae" | sort -u | wc -l
     113


查找提交信息
===================

* 搜索在提交信息中含有'c90'的所有提交内容::

    git log --grep='C90' --pretty=oneline

文件历史
===============

* 查看'notes.c'文件每一次的提交历史::

    git log --pretty=oneline -- notes.c

其他选项
===============

* 查看非合并的提交历史记录::

    git log --pretty=oneline --no-merges

* 在查看日志命令最后加上-N来查看满足条件的最近的N条历史记录::

    git log --pretty=oneline --no-merges -5

* 提交历史::

    git log --pretty=oneline --graph

* 我们可以这样指定查询::

    git log --pretty=oneline 710f0f..8a5cbc

* 想查看'experiment'分枝上还没有合并的提交记录::

    git log master..experiment --pretty=oneline

* 


