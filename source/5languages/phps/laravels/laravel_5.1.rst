laravel5.1
================



--------------------------
::


   // 启动一个新的laravel项目
   laravel new <blog>
   or
   composer create-project laravel/laravel <blog> --prefer-dist
   or
   git clone https://github.com/laravel/quickstart-basic quickstart
   cd quickstart
   composer install
   php artisan migrate

   // 配置
   //Directory Permissions目前权限——以下目录要有可定权限
   storage/
   bootstrap/cache/
   // Configuration Caching
   php artisan config:cache     //生产环境用，把配置文件合并到一个文件中，加快framework的load
   //Application Key
   key should been set by the key:generate command
   //修改配置文件config/app.php
   timezone
   locale

   // 配置文件的设置
   $value = config('app.timezone');                  // get方法
   config(['app.timezone' => 'America/Chicago']);    // set方法

   // 修改你的应用（暂不用）
   php artisan app:name Horsefly

   //维护模式
   php artisan down    // 启用
   php artisan up      // 关闭
   // 启用时会抛出code为503的HttpException，并打开默认页面resources/views/errors/503.blade.php



   //Database Migrations
   //在database/migrations目录下生成数据表操作文件
   php artisan make:migration create_tasks_table --create=<tasks>
   // 执行database/migrations目录下文件的数据表修改
   php artisan migrate

   //Eloquent is Laravel's default ORM (object-relational mapper).
   php artisan make:model <Task>
   

   
