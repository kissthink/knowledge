expect相关文档 
=======================

::

    #!/usr/bin/expect
    set timeout 30    # set timeout 30秒,timeout -1 为永不超时
    spawn ssh -l username 192.168.1.1  # 给ssh运行进程加个壳，用来传递交互指令
    expect "password:"  # 判断上次输出结果里是否包含“password:”的字符串，如果有则立即返回，否等待前面设置的30秒后返回
    send "ispass\r"   # 执行交互动作，与手工输入密码的动作等效
    interact   # 执行完成后保持交互状态，把控制权交给控制台


    $argv # 参数数组,使用$argv [n]获得, n从0开始



