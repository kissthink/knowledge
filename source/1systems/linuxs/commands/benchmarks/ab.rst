.. _ab:

ab命令使用方法
=================

* 使用方法::

    Usage: ./ab [options] [http://]hostname[:port]/path
    Options are:
    -n requests Number of requests to perform
    -c concurrency Number of multiple requests to make
    -t timelimit Seconds to max. wait for responses
    -p postfile File containing data to POST
    -T content-type Content-type header for POSTing
    -v verbosity How much troubleshooting info to print
    -w Print out results in HTML tables
    -i Use HEAD instead of GET
    -x attributes String to insert as table attributes
    -y attributes String to insert as tr attributes
    -z attributes String to insert as td or th attributes
    -C attribute Add cookie, eg. ‘Apache=1234. (repeatable)
    -H attribute Add Arbitrary header line, eg. ‘Accept-Encoding: gzip’
    Inserted after all normal header lines. (repeatable)
    -A attribute Add Basic WWW Authentication, the attributes
    are a colon separated username and password.
    -P attribute Add Basic Proxy Authentication, the attributes
    are a colon separated username and password.
    -X proxy:port Proxyserver and port number to use
    -V Print version number and exit
    -k Use HTTP KeepAlive feature
    -d Do not show percentiles served table.
    -S Do not show confidence estimators and warnings.
    -g filename Output collected data to gnuplot format file.
    -e filename Output CSV file with percentages served
    -h Display usage information (this message)

* 实例(同时处理1000个請求并运行100次index.php)::

    ./ab -c 1000 -n 100 http://blog.programfan.info/index.php




