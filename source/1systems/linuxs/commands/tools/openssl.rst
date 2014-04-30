openssl命令
------------------

简单使用::

    // 生成服务器端的私钥(运行时会提示输入密码,此密码用于加密key文件)
    openssl genrsa -des3 -out zhaoweiguo.com.key 1024
    // 去除key文件口令的命令
    openssl rsa -in zhaoweiguo.com.key -out zhaoweiguo.com_nopass.key
    // 生成Certificate Signing Request（CSR）
    // 生成的csr文件交给CA签名后形成服务端自己的证书
    //屏幕上将有提示,依照其指示一步一步输入要求的个人信息即可
    openssl req -new -key zhaoweiguo.com.key -out zhaoweiguo.com.csr

    openssl x509 -req -days 365 -in zhaoweiguo.com.csr -signkey zhaoweiguo.com.key -out zhaoweiguo.com.crt


nginx配置::

    server
    {
    server_name sms.api.bz;
    listen  443;
    index index.html index.htm index.php;

    root  /data0/htdocs/api.bz;

    ssl on;
    ssl_certificate api.bz.crt;
    ssl_certificate_key api.bz_nopass.key;
    ......
    }

