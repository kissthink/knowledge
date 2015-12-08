.. _git_command2:

Git命令2
=============

分支命令
------------
* 查看分支列表::

    git branch
    or
    git branch -r  //查看远程分支
    or
    git branch -a  //查看全部分支

* 新建分支::

    git branch <branchName>
    or
    git checkout -b <new_branch_name> <tag_name>  (在<tag_name的基础上新建一分支>)

* 切换分支::

    git checkout <branchName>
    or
    git checkout --track origin/<branchName>
    or
    git checkout <branchName> origin/<branchName>

* 删除分支::

    git branch -d <branchName>   //删除本地分支
    git branch -D <branchName>   //删除未提交的分支

    git branch -d -r origin/<branchName>    //删除远程分支
    git push origin :<branchName>

    //删除远程分支后，其他本地版本同步
    git fetch -p
    // p, --prune
    //    After fetching, remove any remote-tracking branches which no longer exist on the remote.

* 合并分支(把<branchName>分支合并到当前分支)::

    git merge <branchName>
    or
    git merge --no-ff <branchName>   //每次都会生成一个commit对象

* 把本地分支push到远程分支::

    git push origin <branchName>


*  git show 命令查看相应标签的版本信息，并连同显示打标签时的提交对象::

     git show <tagName>


标签命令
----------------
* 查看标签列表::

    git tag    //查看本地标签列表
    or
    git ls-remote origin     //查看远端标签列表

* 查看指定标签详情::

    git show <tagName>

* 新建标签::

    git tag <tagName>
    or
    git tag -a <tagName> -m "<commit>"
    or
    git tag -a <tagName> <recordId>  %在历史上指定的记录上加tag


* 把本地标签push到远程分支::

    git push refs/tags/<tagName>
    or
    git push origin --tags
    or
    git push --tags
    or
    git push origin <tagname>

* 删除标签::

    git tag -d <tagName>
    git push origin :refs/tags/<tagName>   // 删除远端服务器的标签
    or
    git push origin :<tagname>


git remote命令
---------------------

::

    git remote show origin
    git ls-remote --heads origin
    git remote -v

