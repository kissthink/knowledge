.. _node_example:

node实例
#######################

* 启动与依赖::

    npm install nodemon -g   // 使用命令nodemon app.js, 保存时自动加载
    npm install -d    // 使用package.json文件

* pomelo::

    git clone git://github.com/NetEase/pomelo.git


* Express 是一个简洁而灵活的node.js Web应用框架::

    var express = require('express');
    var app = express();
    app.get('/hello.txt', function(req, res){
       res.send('Hello World');
    });

* grunt::

    npm install  -g grunt-cli   //  JavaScript Task Runner
    npm install grunt


