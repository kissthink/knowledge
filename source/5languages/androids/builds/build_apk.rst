apk反编译
================

::

   1.unzip -d <folder> <name>.apk    //解压apk文件到目录
   2.删除目录中的META-INF目录（里面有加密信息）
   or
   zip -d <name>.apk META-INF   // 直接从此压缩文件中删除指定文件夹
