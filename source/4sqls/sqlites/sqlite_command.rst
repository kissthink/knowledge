.. _sqlite_command:

sqlite基本命令
####################

基本命令::

    .databases
    .tables
    .exit/.quit

    .header on/off          --开启/关闭头显示
    .echo ON|OFF            --
    .timer ON|OFF 
    .schema <tableName>     --查看表结构

    .read <fileName>        --运行<fileName>里的sql

    select * from sqlite_master where type="table";
    select * from sqlite_master where type="table" and name="<tableName>";

    .output <fileName>       --設定输出到<fileName>
    select * from <tableName>   --输出会写入到<fileName>文件中
    .output stdout              --恢复





