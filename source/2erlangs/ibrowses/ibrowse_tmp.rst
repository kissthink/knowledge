.. _ibrowse_tmp:

暂时
=====



* First, send a json type html request::

    erl>>ibrowse:send_req("http://192.168.10.102:8000/baseinfo", [{"Accept","application/json"}], get, [], []).

    to be noticed:
    1, be sure have a "http://"
    2, use {"Accept", "application/json"}, to ensure it is the json type request, default is "text/html"

* Second:

1, baseinfo::

    ibrowse:send_req("http://172.16.0.4:8000/tongji/baseinfo", [{"Accept","application/json"}], post, ["{\"rid\":\"{sim, imei, mac}\", \"sim\":\"sim\", \"imei\":\"imei\", \"mac\":\"mac\", \"device\":\"design G7\", \"resolution\":\"300*400\", \"os\":\"android\", \"osversion\":\"2.2\", \"timestamp\":\"23421321421532143\"}"], []). 


2, versioninfo::

    ibrowse:send_req("http://172.16.0.4:8000/tongji/versioninfo", [{"Accept","application/json"}], post, ["{\"rid\":\"{sim, imei, mac}\",\"appid\":\"appid0001\", \"appname\":\"wiwigo747\", \"cpid\":\"cpid00001\", \"cpname\":\"heimi360\", \"appversion\":\"300*400\", \"sdkversion\":\"v0.1 beta\", \"timestamp\":\"23421321421532143\"}"], []).


3, crashinfo:
    ibrowse:send_req("http://172.16.0.4:8000/tongji/crashinfo", [{"Accept","application/json"}], post, ["{\"rid\":\"{sim, imei, mac}\",\"appid\":\"appid0001\", \"appname\":\"wiwigo747\", \"cpid\":\"cpid00001\", \"cpname\":\"heimi360\", \"appversion\":\"300*400\", \"sdkversion\":\"v0.1 beta\", \"content\":\"crash info; crash info; crash info; crash info; crash info; crash info; crash info; crash info; crash info; crash info; crash info; crash info; crash info; crash info; crash info; crash info; crash info; crash info; crash info; crash info; crash info; crash info; crash info; \", \"timestamp\":\"23421321421532143\"}"], []).

4, appinfo::

    ibrowse:send_req("http://172.16.0.4:8000/tongji/appinfo", [{"Accept","application/json"}], post, ["{\"rid\":\"{sim, imei, mac}\",\"vid\":\"{rid, timestamp}\",\"appid\":\"appid0001\",  \"appname\":\"wiwigo747\", \"cpid\":\"cpid00001\", \"cpname\":\"heimi360\"}"], []).

5, gpscourseinfo::

    ibrowse:send_req("http://172.16.0.4:8000/tongji/gpscourseinfo", [{"Accept","application/json"}], post, ["{\"rid\":\"{sim, imei, mac}\",\"vid\":\"{rid, timestamp}\", \"startstamp\":\"23421321421532143\", \"endstamp\":\"23421321421532143\"},\"appid\":\"appid0001\", \"appname\":\"wiwigo747\", \"cpid\":\"cpid00001\", \"cpname\":\"heimi360\"}"], []).

6, gpsinfo::

    ibrowse:send_req("http://172.16.0.4:8000/tongji/gpsinfo", [{"Accept","application/json"}], post, ["{\"rid\":\"{sim, imei, mac}\",\"vid\":\"{rid, timestamp}\", \"appid\":\"appid0001\", \"appname\":\"wiwigo747\", \"cpid\":\"cpid00001\", \"cpname\":\"heimi360\", \"timestamp\":\"23421321421532143\", \"longitude\":\"39.90973623453719\", \"latitude\":\"116.3671875\"}"], []).

7, buttoninfo::

    ibrowse:send_req("http://172.16.0.4:8000/tongji/buttoninfo", [{"Accept","application/json"}], post, ["{\"rid\":\"{sim, imei, mac}\",\"vid\":\"{rid, timestamp}\", \"appid\":\"appid0001\", \"appname\":\"wiwigo747\", \"cpid\":\"cpid00001\", \"cpname\":\"heimi360\", \"timestamp\":\"23421321421532143\", \"buttonname\":\"search\", \"clicknum\":\"11\"}"], []).

8,actinfo::

    ibrowse:send_req("http://172.16.0.4:8000/tongji/buttoninfo", [{"Accept","application/json"}], post, ["{\"rid\":\"{sim, imei, mac}\",\"vid\":\"{rid, timestamp}\", \"appid\":\"appid0001\", \"appname\":\"wiwigo747\", \"cpid\":\"cpid00001\", \"cpname\":\"heimi360\", \"timestamp\":\"23421321421532143\", \"buttonname\":\"search\", \"cid\":\"{rid, actname}\"}"], []).







4Here are some usage examples. Enjoy!::

    5> ibrowse:start().
    {ok,<0.94.0>}

    %% A simple GET
    6> ibrowse:send_req("http://intranet/messenger/", [], get).
    {ok,"200",
        [{"Server","Microsoft-IIS/5.0"},
         {"Content-Location","http://intranet/messenger/index.html"},
         {"Date","Fri, 17 Dec 2004 15:16:19 GMT"},
         {"Content-Type","text/html"},
         {"Accept-Ranges","bytes"},
         {"Last-Modified","Fri, 17 Dec 2004 08:38:21 GMT"},
         {"Etag","\"aa7c9dc313e4c41:d77\""},
         {"Content-Length","953"}],
        "<html>\r\n\r\n<head>\r\n<title>Messenger</title>\r\n<meta name=\"GENERATOR\" content=\"Microsoft FrontPage 5.0\">\r\n<meta name=\"ProgId\" content=\"FrontPage.Editor.Document\">\r\n<meta name=\"description\" content=\"Messenger Home Page\">\r\n</head>\r\n\r\n<frameset border=\"0\" frameborder=\"0\" rows=\"60,*\">\r\n  <frame src=\"/messenger/images/topnav.html\" name=\"mFrameTopNav\" scrolling=\"NO\" target=\"mFrameMain\">\r\n  <frameset cols=\"18%,*\">\r\n    <frameset rows=\"*,120\">\r\n      <frame src=\"index-toc.html\" name=\"mFrameTOC\" target=\"mFrameMain\" scrolling=\"auto\"  noresize=\"true\">\r\n      <frame src=\"/shared/search/namesearch.html\" name=\"mFrameNameSearch\" scrolling=\"NO\" target=\"mFrameMain\">\r\n    </frameset>\r\n    <frame src=\"home/16-12-04-xmascardsmms.htm\" name=\"mFrameMain\" scrolling=\"auto\" target=\"mFrameMain\" id=\"mFrameMain\">\r\n  </frameset>\r\n  <noframes>\r\n  <body>\r\n\r\n  <p><i>This site requires a browser that can view frames.</i></p>\r\n\r\n  </body>\r\n  </noframes>\r\n</frameset>\r\n\r\n</html>"}



    %% =============================================================================
    %% A GET using a proxy
    7> ibrowse:send_req("http://www.google.com/", [], get, [], 
                     [{proxy_user, "XXXXX"},
                      {proxy_password, "XXXXX"},
                      {proxy_host, "proxy"},
                      {proxy_port, 8080}], 1000).
    {ok,"302",
        [{"Date","Fri, 17 Dec 2004 15:22:56 GMT"},
         {"Content-Length","217"},
         {"Content-Type","text/html"},
         {"Set-Cookie",
          "PREF=ID=f58155c797f96096:CR=1:TM=1103296999:LM=1103296999:S=FiWdtAqQvhQ0TvHq; expires=Sun, 17-Jan-2038 19:14:07 GMT; path=/; domain=.google.com"},
         {"Server","GWS/2.1"},
         {"Location",
          "http://www.google.co.uk/cxfer?c=PREF%3D:TM%3D1103296999:S%3Do8bEY2FIHwdyGenS&prev=/"},
         {"Via","1.1 netapp01 (NetCache NetApp/5.5R2)"}],
        "<HTML><HEAD><TITLE>302 Moved</TITLE></HEAD><BODY>\n<H1>302 Moved</H1>\nThe document has moved\n<A HREF=\"http://www.google.co.uk/cxfer?c=PREF%3D:TM%3D1103296999:S%3Do8bEY2FIHwdyGenS&amp;prev=/\">here</A>.\r\n</BODY></HTML>\r\n"}


    %% =============================================================================
    %% A GET response saved to file. A temporary file is created and the
    %% filename returned. The response will only be saved to file is the
    %% status code is in the 200 range. The directory to download to can
    %% be set using the application env var 'download_dir' - the default
    %% is the current working directory.
    8> ibrowse:send_req("http://www.erlang.se/", [], get, [],
                     [{proxy_user, "XXXXX"},
                      {proxy_password, "XXXXX"},
                      {proxy_host, "proxy"},
                      {proxy_port, 8080},
                      {save_response_to_file, true}], 1000).
    {error,req_timedout}
    %% you can change the timeout number to 5000 to get the proper answer.


    %% =============================================================================
    %% Setting size of connection pool and pipeline size. This sets the
    %% number of maximum connections to this server to 10 and the pipeline
    %% size to 1. Connections are setup a required.
    11> ibrowse:set_dest("www.hotmail.com", 80, [{max_sessions, 10},
                                                 {max_pipeline_size, 1}]).
    ok

    %% =============================================================================
    %% Example using the HEAD method
    56> ibrowse:send_req("http://www.erlang.org", [], head).
    {ok,"200",
        [{"Date","Mon, 28 Feb 2005 04:40:53 GMT"},
         {"Server","Apache/1.3.9 (Unix)"},
         {"Last-Modified","Thu, 10 Feb 2005 09:31:23 GMT"},
         {"Etag","\"8d71d-1efa-420b29eb\""},
         {"Accept-ranges","bytes"},
         {"Content-Length","7930"},
         {"Content-Type","text/html"}],
        []}



    %% =============================================================================
    %% Example using the OPTIONS method
    62> ibrowse:send_req("http://www.sun.com", [], options).   
    {ok,"200",
        [{"Server","Sun Java System Web Server 6.1"},
         {"Date","Mon, 28 Feb 2005 04:44:39 GMT"},
         {"Content-Length","0"},
         {"P3p",
          "policyref=\"http://www.sun.com/p3p/Sun_P3P_Policy.xml\", CP=\"CAO DSP COR CUR ADMa DEVa TAIa PSAa PSDa CONi TELi OUR  SAMi PUBi IND PHY ONL PUR COM NAV INT DEM CNT STA POL PRE GOV\""},
         {"Set-Cookie",
          "SUN_ID=X.X.X.X:169191109565879; EXPIRES=Wednesday, 31-Dec-2025 23:59:59 GMT; DOMAIN=.sun.com; PATH=/"},
         {"Allow",
          "HEAD, GET, PUT, POST, DELETE, TRACE, OPTIONS, MOVE, INDEX, MKDIR, RMDIR"}],
        []}

    %% =============================================================================
    %% Example of using Asynchronous requests
    18> ibrowse:send_req("http://www.google.com", [], get, [], 
                         [{proxy_user, "XXXXX"}, 
                          {proxy_password, "XXXXX"}, 
                          {proxy_host, "proxy"}, 
                          {proxy_port, 8080}, 
                          {stream_to, self()}]).
    {ibrowse_req_id,{1115,327256,389608}}
    19> flush().
    ... ...
    %% =============================================================================
    %% Example of request which fails when using the async option. Here
    %% the {ibrowse_req_id, ReqId} is not returned. Instead the error code is
    %% returned.  
    68> ibrowse:send_req("http://www.earlyriser.org", [], get, [], [{stream_to, self()}]).
    {error,conn_failed}

    %% Example of request using both Proxy-Authorization and authorization by the final webserver.
    17> ibrowse:send_req("http://www.erlang.se/lic_area/protected/patches/erl_756_otp_beam.README", 
                         [], get, [], 
                         [{proxy_user, "XXXXX"}, 
                          {proxy_password, "XXXXX"}, 
                          {proxy_host, "proxy"}, 
                          {proxy_port, 8080}, 
                          {basic_auth, {"XXXXX", "XXXXXX"}}]).
    ... ...









