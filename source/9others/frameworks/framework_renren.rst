.. _framework_renren:

人人网技术架构
==================


* 人人网开放平台技术架构图:

.. figure:: images/renren_layering_architecture.jpg
   :width: 70%


* Auth API

第三方如果想调用人人网提供的Rest API，则必须首先经过用户授权。Auth API就是用来完成用户授权的。
目前，人人网开放平台进行用户授权遵循业界最新的标准OAuth 2.0，详情请参考：用户验证与授权。

* Rest API

Rest API是人人网开放平台提供的一种使用HTTP协议来调用的API，需要在完成用户授权后才能调用。
各个Rest API的接口参数定义详见Rest API。

* Widget API

Widget API是人人网开放平台提供的一种在用户控制下访问用户资源的一种API，由于是在用户控制下完成的，所以无需进行用户授权（但用户身份验证还是必需的）。这种API能够支持各种不同的运行环境，如web、mobile、桌面编程环境等等。




开放平台领域的社会化分工
------------------------------


新的经过清晰分层的人人网开放平台技术架构，有利于促进开放平台领域的社会化分工。
在之前，第三方应用开发者所使用的所有API，大部分都由开放平台官方提供，包括各种开发SDK。而经过架构分层，底层的Core Service Layer提供的API被清晰地定义，就可以将底层接口的开发和SDK的开发明确的区分开来。这样带来的好处是：开放平台集中精力提供底层的接口，致力于增加接口种类，而上层的SDK封装工作可以由第三方开发者自己或开源社区来进行。
为了促进开放平台领域的发展，人人网开放平台倡导开源精神，集中开源社区的力量，对有利于第三方开发者进行开发或接入的代码进行开源管理。这这些开源的代码一部分由人人网开放平台官方开发出初始版本，然后发布为开源的license，由开源社区来管理；另一部分直接由开源社区来贡献。


流程图
--------

.. figure:: images/renren_workflow_example1.png
   :width: 50%





