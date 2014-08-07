.. _git_command:

GIT命令
=========

一，基本命令
--------------


    #. ``git clone`` ::

        $git clone git://github.com/someone/some_project.git some_project

    说明:将 *git://github.com/someone/some_project.git* 这个URL地址的远程版本库完全克隆到本地some_project目录下面

    #. ``git init`` 和 ``git remote`` ::

        $git init
        $git remote add origin git://github.com/someone/another_project.git

    说明:本地创建了一个工作目录，进入这个目录，使用 ``git init`` 命令进行初始化。在远程服务器上创建一个目录，并把可访问的URL记录下来，利用 ``git remote add`` 命令来增加一个远程服务器端

    #. 其他命令::

        $git pull origin master
        $git add somefiles(folders)
        $git rm somefiles(folders)
        $git commit -m "some message"
        $git push origin
        $git log //查看历史日志
        $git revert bbaf6fb5060b4875b18ff9ff637ce118256d6f20 //还原一个版本的修改，必须提供一个具体的Git版本号,Git的版本号都是生成的一个哈希值

二、用Git ssh方式快速建立一个Git服务器
----------------------------------------

    服务端命令如下(以test为例)::

        cd /path/to/my/workspace
        mkdir test
        cd test
        git init
        cd ..
        git clone --bare test test.git (一定要执行这个命令)
        rm -rf test

    客户端获取命令如下::

        git clone git@server:/path/to/my/workspace/test.git
        ... //剩下就是最基本的操作了


专用命令
------------

    上面的命令是每个版本控制工具都有的，下面的命令是git自有的:

      2. ``git checkout`` ::

          $git checkout app/model/user.rb //将user.rb文件从上一个已提交的版本中更新回来，未提交的内容全部会回滚

      3. ``git rebase`` ::

          // 可以用来修改commit的内容
          $git rebase -i <branch>/<tag>/<version>
          //实例:
          git rebase -i master


      4. ``git reset`` (将当前的工作目录完全回滚到指定的版本号), 例:有A-G五次提交的版本，其中C的版本号是 bbaf6fb5060b4875b18ff9ff637ce118256d6f20，我们执行::

          $git reset bbaf6fb5060b4875b18ff9ff637ce118256d6f20 //

    那么结果就只剩下了A-C三个提交的版本
      5. ``git stash`` (将当前未提交的工作存入Git工作栈中，时机成熟的时候再应用回来)

      6. ``git config`` (新增、更改Git的各种设置)，如::

          $git config branch.master.remote origin //将master的远程版本库设置为别名叫做origin版本库

      * 合并分支到当前分支上::

           git merge hopen

    * 如果修改文件后想放弃修改可以使用::

        git checkout -- <fileName>

    * 如果想忽略的文件进入git库::

        git rm -r --cached <folder>
        or
        git rm --cached <file>


跟踪分支
-----------

    说明:
        从远程分支签出的本地分支，称为跟踪分支(tracking branch)。跟踪分支是一种和远程分支有直接联系的本地分支。在跟踪分支里输入 git push，Git 会自行推断应该向哪个服 务器的哪个分支推送数据。反过来，在这些分支里运行 git pull 会获取所有远程索引，并把它们的数据都合并到本地分支中来。
        在克隆仓库时，Git 通常会自动创建一个 master 分支来跟踪 origin/master。这正是 git push 和 git pull 一开始就能正常工作的原因。当然，你可以随心所欲地设定为其它跟踪分支，比如 origin 上除了 master 之外的其它分支。刚才我们已经看到了这样的一个例子：git checkout -b [分支名] [远程名]/[分支名]。如果你有 1.6.2 以上版本的Git，还可以用 --track 选项简化:

            1. Branch serverfix set up to track remote branch refs/remotes/origin/hopen::

                 $ git checkout --track origin/hopen

            2. Switched to a new branch "sf"::

                 $git checkout -b sf origin/hopen


