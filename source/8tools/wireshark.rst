wireshark命令
======================

技巧::

    右键Follow TCP Stream就可以看到完整的HTTP通信内容
    PS: 在filter中会有tcp.stream eq xx的字样, 说明就是过滤出了tcp.stream == xx的包而已
    以后遇到这种类型的包, 或是想查看完整的HTTP通信过程就方便多了, 不用一个个包去找了


mac使用事项::

  // wireshark在mac下打开监控不到网卡时
  // 把以下文件修改为有权限
  chgrp admin /dev/bpf*
  chmod g+rw /dev/bpf*





