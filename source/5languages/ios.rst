ios相关文档 
####################



* storyboard中三个标识::

    an orange cube that represents the first responder
    a yellow sphere that represents the scene’s view controller objct
    a green square that represents the destination of an unwind segue.


* 常用的菜单::

    Editor > Embed In > Navigation Controller

* property的几个实例::

    nonatomic
    copy
    weak/strong
    

* 收集::

    the _name, _location, and _date symbols refer to the instance variables that these properties represent
    the accessor methods—such as self.name;
    By convention, the underscore serves as a reminder that you shouldn’t access instance variables directly.
    The only two places where you should not use accessor methods are in init methods—such as initWithName—and in dealloc methods.
    
    a mutable array, which is an array that can grow.
    the copy attribute in (nonatomic, copy): It specifies that a copy of the object should be used for assignment.
    A class extension allows you to declare a method that is private to the class



* 方法::

    dispatch_async的意思就是将任务进行异步并行处理
    dispatch_group_async

    dispatch_get_main_queue() 函数就是返回主线程
    dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0) 得到系统队列
    //还有两个:DISPATCH_QUEUE_PRIORITY_HIGH, DISPATCH_QUEUE_PRIORITY_LOW
    
* 说明::

    Grand Central Dispatch或者GCD，是一套低层API，提供了一种新的方法来进行并发程序编写。
