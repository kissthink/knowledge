tmux使用
################


tmux命令
------------

安装::

    brew install tmux
    sudo port install tmux
    sudo apt-get install tmux


基本命令::

    tmux    //启动
    exit    // 退出
    PREFIX: Ctrl+b
    PREFIX ?   //打印帮助信息


Session相关::

    tmux new -s <tmuxName>   // tmux new-session -s <tmuxName>
    tmux new -s <tmuxName> -d   // 后台创建一新session
    PREFIX d    //离开session
    tmux ls    // tmux list-sessions
    tmux attach -t <tmuxName>     // 连接指定session
    tmux kill-session -t <tmuxName>

windows相关::

    tmux new -s <sessionName> -n <windowName>
    PREFIX c     // 在sesson中创建新的window
    PREFIX ,    //修改window名
    PREFIX n     //移动到下一个window下
    PREFIX p     //移动到前一个window下
    PREFIX <num>    //移动到第<num>个window下(<num>取值从0-9)
    PREFIX f      // 切换到指定window下
    PREFIX w      //把当前session下的window列表列出
    PREFIX &      // 同exit,有确认窗口

panel相关::

    PREFIX %     //vertically split into two panels
    PREFIX "     //horizontally split into two panels
    PREFIX o     //在不同panel间
    PREFIX q     // 显示window下不同panel对应的数值
    PREFIX x     // 关闭panel
    PREFIX Space   //切换layout



tmux配置
--------------
::

    /etc/tmux.conf
    ~/.tmux.conf

编辑文件tmux.conf::

    set -g prefix C-a    //把prefix绑定为Ctrl+a
    unbind C-b           //把Ctrl+b取消绑定
    set -g base-index 1    //window的索引,默认从0开始
    set -g pane-base-index 1    //panel的索引,默认从1开始


.. warning::

    修改tmux.conf文件后不会立即生效, 你需要关闭所有tmux窗口或键入 ``PREFIX :`` 并输入 ``source-file ~/.tmux.conf``



