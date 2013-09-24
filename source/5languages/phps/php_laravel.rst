Laravel——php框架
###############################

* 要先安装 `composer <http://getcomposer.org>`_
* 部署环境时要在下载项目之后执行 ``composer install``

::

    app/config/app.php
    bootstrap/paths.php
    app/database/migrations     // 生成的表结构文件
    

::

    Config::get('app.timezone');    //access a configuration value
    $timezone = Config::get('app.timezone', 'UTC');     // set a default value
    Config::set('database.default', 'sqlite');    // set a configuration value

::

    php artisan migrate:make <create_users_table>    // 创建表
    php artisan migrate:install
    php artisan migrate:refresh



要可写的目录::

    /storage
    
