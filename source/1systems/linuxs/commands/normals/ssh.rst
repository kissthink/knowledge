ssh命令
#########################


* 把远端的端口3306影射到本地的3308(把远端的mysql通过本地访问,有bindaddress配置的mysql)::

    ssh -L 3308:<ip>:3306 <user>@<host>

* 指定一个动态应用级端口做转发,然后可以在浏览器做代理,通过指定服务器进行访问（如翻墙）::

    ssh -D 7070 username@yourserver.com






