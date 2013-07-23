.. _ibrowse_introduce:

简介
====

.. _introduce_feature:

ibrowse特性
============


ibrowse是一个HTTP客户端,下面是ibrowse的特性:

        - RFC2616 compliant (AFAIK) 
        - 支持 GET, POST, OPTIONS, HEAD, PUT, DELETE, TRACE, MKCOL, PROPFIND, PROPPATCH, LOCK, UNLOCK, MOVE and COPY
        - 支持 HTTP/0.9, HTTP/1.0 and HTTP/1.1
        - 支持 chunked encoding
        - Can generate requests using Chunked Transfer-Encoding
        - Pools of connections to each webserver
        - Pipelining support
        - 下载到文件
        - Asynchronous requests. Responses are streamed to a process
        - 基本的认证
        - 支持代理认证
        - 可以用SSL与安全webservers交互
        - 其他特性

ibrowse有两种许可证:LGPL或BSD license
