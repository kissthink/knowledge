.. _git_config:

git配置
############

修改设置::

    $ git config --global user.name "Scott Chacon"
    $ git config --global user.email "schacon@gmail.com"
    $ git config --global core.editor 'emacs'

查看设置::

    git config user.name

* If the identity used for this commit is wrong, you can fix it with::

    git commit --amend --author='Your Name <you@example.com>'

* 你也可以自己编辑文件内容。git首先会检查'/etc/gitconfig'，然后是'~/.gitconfig'最后是'.git/config'，这些文件里的内容格式类似这样::

    [user]
        name = Gordon
        email = zhaoweiguo@maxvox.com.cn
    [core]
        editor = emac



