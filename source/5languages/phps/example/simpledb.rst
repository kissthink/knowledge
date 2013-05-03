.. _simpledb:

简单的数据库实例
=================


* db_login.php::

    <?php
    $db_host='localhost';
    db_database = 'wordpress';
    db_username = 'root';
    db_password='sa';
    ?>

* db_select.php::

    <?php
    $select = ' SELECT ';
    $column = '* ';
    $from = ' FROM ';
    $tables = ' wp_users ';
    $query = $select.$column.$from.$tables;
    ?>

* db_test.php::

    <?php
    include('db_login.php');
    include('db_select.php');
    $connection = mysql_connect( $db_host, $db_username, $db_password );
    if(!$connection) {
        die ("Could not connect to the database: <br />".mysql_error());
    }

    $db_select = mysql_select_db($db_database);
    if(!$db_select) {
        die ("Could not select the database: <br />".mysql_error());
    }

    $result = mysql_query( $query );
    if(!$result) {
        die ("Could not query the databases: <br />".mysql_error());
    }

    while ($result_row = mysql_fetch_row(($result))) {
        echo 'ID: '.$result_row([1].' <br />';
        echo 'user_login '.$result_row[2].' <br />';
        echo 'user_email '.$result_row[5].' <br />';
    }
    mysql_close($connection);
    ?>

