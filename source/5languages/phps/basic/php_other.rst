php其他基本功能说明
#############################

* 修改时区::

    //修改php.ini文件
    date.timezone =Asia/Shanghai

    //文件修改
    <?php
    date_default_timezone_set('Asia/Shanghai');//'Asia/Shanghai'   亚洲/上海
    date_default_timezone_set('Asia/Chongqing');//其中Asia/Chongqing'为“亚洲/重庆”
    date_default_timezone_set('PRC');//其中PRC为“中华人民共和国”
    ini_set('date.timezone','Etc/GMT-8');
    ini_set('date.timezone','PRC');
    ini_set('date.timezone','Asia/Shanghai');
    ini_set('date.timezone','Asia/Chongqing');



