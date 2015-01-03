.. _php_basic_string:

php基本的字符串使用
======================

* 基本使用::

    22 == "22"; // 返回 true 
    22 === "22"; // 返回false
    0 == "我爱你"; // 返回true 
    1 == "1 我爱你";// 返回true

* 字符串比较函数::

    strcmp,strcasecmp,strncasecmp(), strncmp()
    //如果前者比后者大,则返回大于0的整数；如果前者比后者小，则返回小于0的整数；如果两者相等，则返回0

    echo strcmp("Hello world!","Hello world!");
    // 0, 二进制安全的，且对大小写敏感

    echo strcasecmp("Hello world!","HELLO WORLD!");
    // 0, 二进制安全的，且对大小写不敏感

    echo strncasecmp("Hello world!","Hello earth!",6);
    // 0, 二进制安全的，且对大小写不敏感

    echo strncmp("Hello world!","Hello earth!",6);
    // 0, 二进制安全的，且对大小写敏感

::

   // 字串分离
   explode("fff,ffff", ",")
   // 字串长度
   strlen("fff,ffff")







