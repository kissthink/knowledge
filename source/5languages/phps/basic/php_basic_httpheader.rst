简单的http请求修改header的案例
######################################

::

    header("Cache-Control: private, must-revalidate, proxy-revalidate");
    header("ETag: " . substr($etag, 0, 18)); // 指定etag
    header("Content-type: image/jpeg");    //指定文本类型——图片
    header("Content-length: " . filesize("fingerprinting.jpg"));    // 指定图片内容
    readfile("fingerprinting.jpg");      //读出文本内容，即可显示出来






