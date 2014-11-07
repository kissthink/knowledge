tcpcopy命令
================

On the assistant server which runs intercept(root privilege is required)::

       ./intercept -F <filter> -i <device,>
       ./intercept -i eth0 -F 'tcp and src port 8080' -d


On the online source server (root privilege is required)::

      ./tcpcopy -x localServerPort-targetServerIP:targetServerPort -s <intercept server,> [-c <ip range,>]
      ./tcpcopy -x 80-61.135.233.160:8080 -s 61.135.233.161 -c 62.135.200.x




