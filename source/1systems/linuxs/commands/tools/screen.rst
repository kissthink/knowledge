screen命令使用
==================

::

   screen -ls
   
   // 恢复会话
   screen -r 16582
   screen -r <name>
   
   screen -x

   screen -R <name>



每个screen session 下::

   C-a ? -> 显示所有键绑定信息
   C-a c -> 创建一个新的运行shell的窗口并切换到该窗口
   C-a n -> Next，切换到下一个 window
   C-a p -> Previous，切换到前一个 window
   C-a 0..9 -> 切换到第 0..9 个 window
   Ctrl+a [Space] -> 由视窗0循序切换到视窗9
   C-a C-a -> 在两个最近使用的 window 间切换
   C-a x -> 锁住当前的 window，需用用户密码解锁
   C-a d -> detach，暂时离开当前session，将目前的 screen session (可能含有多个 windows) 丢到后台执行，并会回到还没进 screen 时的状态，此时在 screen session 里，每个 window 内运行的 process (无论是前台/后台)都在继续执行，即使 logout 也不影响。
   C-a z -> 把当前session放到后台执行，用 shell 的 fg 命令则可回去。
   C-a w -> 显示所有窗口列表
   C-a t -> Time，显示当前时间，和系统的 load
   C-a k -> kill window，强行关闭当前的 window
   C-a [ -> 进入 copy mode，在 copy mode 下可以回滚、搜索、复制就像用使用 vi 一样





from: http://www.cnblogs.com/mchina/archive/2013/01/30/2880680.html
