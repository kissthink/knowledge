.. _python_simple:

python收集
####################

from: http://woodpecker.org.cn/abyteofpython_cn/chinese/

import相关
----------------------
::

    # 此模块import它上一层的模块
    import sys
    sys.path.append("..")

一些 ``import`` 实例::

    import pymongo
    


第4章 基本概念
---------------------

字符串:

    * 单引号指示字符串,所有的空白，即空格和制表符都照原样保留
    * 双引号中的字符串与单引号中的字符串的使用完全相同
    * 三引号，你可以指示一个多行的字符串;在三引号中自由的使用单引号和双引号

    * 自然字符串——不需要如转义符那样的特别处理的字符串::

        r"Newlines are indicated by \n"
        # '\\1'或r'\1'一样

    * Unicode字符串——国际文本的标准方法(要在字符串前加上前缀u或U)::

        u"This is a Unicode string."

第5章 运算符与表达式
--------------------------
::

    ** 幂 
    // 取整除
    %  取模



第6章 控制流
-------------------
基本格式::

    //if操作
    if guess == number:
        print 'a1'
    elif guess == number2:
        print 'a2'
    else:
        print 'a3'

    //while操作
    while True:
        s = raw_input('Enter something : ')
        if s == 'quit':
            break
        elif s == 'continue':
            continue

    //for操作
    for i in range(1, 5):
        print i
    else:
        print i+1
    //



::

    range(1, 5)
    // [1, 2, 3, 4]


第7章 python函数
--------------------
* 如果一个Python函数、类方法或属性的名字以两个下划线开始(但不是结束), 它是私有的
* 类方法或者是私有 (只能在它们自已的类中使用) 或者是公有 (任何地方都可使用)

::

    def <funName>():    #定义
    ... ...

    <funName>() # 调用


实例1::

    def func(x):
        global y        #全局变量
        print 'x is', x #打印变量
        x = 2    #修改变量

    x = 50  #函数外修改
    func(x) #执行函数

实例2——使用默认参数值::

    def say(message, times = 1):
        print message * times

    say('Hello')
    say('World', 5)



实例3——ifelse、return語句::

    def maximum(x, y):
        if x > y:
            return x
        else:
            return y

    print maximum(2, 3)

DocStrings(文档字符串, 它通常被简称为 ``docstrings``, DocStrings是一个重要的工具, 由于它帮助你的程序文档更加简单易懂, 你应该尽量使用它)::

    def printMax(x, y):
        '''Prints the maximum of two numbers.
        The two values must be integers.'''     # 文档字串
        x = int(x) # convert to integers, if possible
        y = int(y)

        if x > y:
            print x, 'is maximum'
        else:
            print y, 'is maximum'

        printMax(3, 5)
        print printMax.__doc__  #文档打印


第8章 模块
--------------
::

    import sys
    print 'The command line arguments are:'
    for i in sys.argv:
        print i

    print '\n\nThe PYTHONPATH is', sys.path, '\n'


如果你想要直接输入argv变量, 而不用每次使用它时打sys::

    from sys import argv

dir函数::

    import sys
    dir(sys)    # get list of attributes for sys module


第9章 数据结构(list, tuple, dict...)
-----------------------------------------
列表::

    shoplist = ['apple', 'mango', 'carrot', 'banana']   #列表
    print '一共', len(shoplist), '个列表'   #打印列表个数
    for item in shoplist:        #打印列表中的各值
        print item
    shoplist.sort()     #自排序
    del shoplist[0]     #从列表中删除一条

元组::

    zoo = ('wolf', 'elephant', 'penguin')
    new_zoo = ('monkey', 'dolphin', zoo)        #第三个元素是一个元组
    # 打印元组
    age = 22
    name = 'Swaroop'
    print '%s is %d years old' % (name, age)

字典::

    ab = {
       'key1' : 'value1',
       'key2' : 'value2',
       'key3' : 'value3',
       'key4' : 'value4'
     }

     print "key1's value is %s" % ab['key1']

     # 增加一条记录
     ab['key5'] = 'value5'

     # 删除一条记录
     del ab['key3']

     # 打印字典组中数据
     for key, value in ab.items():
         print 'key %s 's value is %s' % (key, value)

     if 'key1' in ab:   # 或 ab.has_key('Guido')
         print "\nkey1's value is %s" % ab['key1']

序列::

    shoplist = ['apple', 'mango', 'carrot', 'banana']
    print 'Item 0 is', shoplist[0]          #'apple'
    print 'Item -2 is', shoplist[-2]        #'carrot'
    print 'Item 1 to 3 is', shoplist[1:3]   #['mango', 'carrot']
    print 'Item 0 to 3 is', shoplist[:3]   #['apple', 'mango', 'carrot']
    print 'Item 1 to 3 is', shoplist[1:]   #['mango', 'carrot', 'banana']

    name = 'swaroop'
    print 'characters 1 to 3 is', name[1:3]     #'wa'




参考::

    shoplist = ['apple', 'mango', 'carrot', 'banana']
    mylist = shoplist    #此乃引用
    mylist = shoplist[:] #此乃全复制


字符串的方法::

    name = 'Swaroop'
    if name.startswith('Swa'):
        print 'Yes, the string starts with "Swa"'
    if 'a' in name:
        print 'Yes, it contains the string "a"'
    if name.find('war') != -1: #得到字符串里含有子字符串对应的位置,没有为-1
        print 'Yes, it contains the string "war"'

    delimiter = '_*_'
    mylist = ['Brazil', 'Russia', 'India', 'China']
    print delimiter.join(mylist)  # Brazil_*_Russia_*_India_*_China



第11章 面向对象的编程
---------------------------------
使用对象的方法::

    class Person:
        def sayHi(self):
            print 'Hello, how are you?'

    p = Person()
    p.sayHi()

    // 結果
    Hello, how are you?

__init__方法(在类的一个对象被建立时, 马上运行)::

    class Person:
        def __init__(self, name):
            self.name = name
        def sayHi(self):
            print 'Hello, my name is', self.name

    p = Person('Swaroop')
    p.sayHi()

    // 結果
    Hello, my name is Swaroop

说明:

    * 双下划线是python的私有变量
    * 单下划线是建议私有变量(不强制)


继承::

    class SchoolMember:
        '''任一学校成员.'''
        def __init__(self, name, age):
            self.name = name
            self.age = age
            print '(初使化成员: %s)' % self.name

        def tell(self):
            '''显示细节.'''
            print '名字:"%s" 年齡:"%s"' % (self.name, self.age),

    class Teacher(SchoolMember):
        '''展现老师情况.'''
        def __init__(self, name, age, salary):
            SchoolMember.__init__(self, name, age)
            self.salary = salary
            print '(初使化老师: %s)' % self.name

        def tell(self):
            SchoolMember.tell(self)
            print '工资: "%d"' % self.salary

    t = Teacher('Mrs. Shrividya', 40, 30000)
    s = Student('Swaroop', 22, 75)

    members = [t, s]
    for member in members:
        member.tell()

    //输出
    Name:"Mrs. Shrividya" Age:"40" Salary: "30000"
    Name:"Swaroop" Age:"22" Marks: "75"


第12章 输入/输出
------------------
使用文件::

    # 往文件里写数据
    f = file('poem.txt', 'w')
    f.write("<...>")
    f.close()

    # 读文件里的数据
    f = file('poem.txt')
    while True:
        line = f.readline()
        if len(line) == 0: # 长度为0意味着EOF
            break
        print line,
    f.close()

储存器(Python提供一个标准的模块，称为pickle。使用它你可以在一个文件中储存任何Python对象，之后你又可以把它完整无缺地取出来。这被称为 持久地 储存对象)::

    # 储存与取储存
    import cPickle as p

    shoplistfile = 'shoplist.data'      #文件名
    shoplist = ['apple', 'mango', 'carrot']     #列表内容
    f = file(shoplistfile, 'w')   # 以写的方式打开文件
    p.dump(shoplist, f)           # 把列表内容存放到之前指定的文件中
    f.close()

    del shoplist
    f = file(shoplistfile)      # 以读的方式打开文件
    storedlist = p.load(f)      # 打开文件
    print storedlist





第13章 异常
-------------------

处理异常::

    try:
        s = raw_input('输入 --> ')
    except EOFError:
        print '\n 产生EOF错误'
        sys.exit() # exit the program
    except:
        print '\n产生其他错误'


引发异常::

    class ShortInputException(Exception):
        '''自定义的异常——ShortInputException.'''
        def __init__(self, length, atleast):
            Exception.__init__(self)
            self.length = length
            self.atleast = atleast

        try:
            s = raw_input('输入 --> ')
            if len(s) < 3:
                raise ShortInputException(len(s), 3)

        except EOFError:
            print '\nEOF错误产生?'
        except ShortInputException, x:
            print 'ShortInputException: 输入长度为 %d, 规定至少为 %d' % (x.length, x.atleast)
        else:
            print '无错误产生.'


第14章 Python标准库
----------------------------
sys模块::

    import sys
    # Script starts from here
    if len(sys.argv) < 2:
        print 'No action specified.'
        sys.exit()

    if sys.argv[1].startswith('--'):
        option = sys.argv[1][2:]
        # fetch sys.argv[1] but without the first two characters
        if option == 'version':
            print 'Version 1.2'
        elif option == 'help':
            print '''\
                 Options include:
                   --version : Prints the version number
                   --help    : Display this help'''
        else:
            print 'Unknown option.'
            sys.exit()

os模块(如果你希望你的程序能够与平台无关的话)::

    os.name     # 指示你正在使用的平台(nt, posix)
    os.getcwd() # 得到当前工作目录
    os.getenv() # 读取环境变量
    os.putenv() # 设置环境变量
    os.listdir()  # 定目录下的所有文件和目录名
    os.remote()   # 删除一个文件
    os.system()   # 运行shell命令
    os.linesep    # 当前平台使用的行终止符(Windows使用'\r\n'，Linux使用'\n'而Mac使用'\r')
    os.path.split() # 一个路径的目录名和文件名
    os.path.isfile()  # 检验给出的路径是一个文件
    os.path.isdir()   # 检验给出的路径是一个目录

第15章 更多Python的内容
--------------------------------

.. csv-table:: 类中一些特殊的方法
   :widths: 30 70
   :header: 名称, 说明

       __init__(self，...),      这个方法在新建对象恰好要被返回使用之前被调用
       _del__(self),             恰好在对象要被删除之前调用
       __str__(self),            在我们对对象使用print语句或是使用str()的时候调用
       __lt__(self，other),      当使用 ``小于`` 运算符（<）的时候调用
       __getitem__(self，key),   使用x[key]索引操作符的时候调用
       __len__(self),            对序列对象使用内建的len()函数的时候调用


列表综合::

    listone = [2, 3, 4]
    listtwo = [2*i for i in listone if i > 2]
    print listtwo

    //結果
    [6, 8]



lambda形式::

    def make_repeater(n):
        return lambda s: s*n

    twice = make_repeater(2)

    print twice('word')


exec和eval语句::

    exec 'print "Hello World"'
    eval('2*3')

assert语句::

    # assert语句用来声明某个条件是真的
    # 当assert语句失败的时候，会引发一个AssertionError
    mylist = ['item']
    assert len(mylist) >= 1
    mylist.pop()
    assert len(mylist) >= 1
    # Traceback (most recent call last):
    #  File "<stdin>", line 1, in ?
    #  AssertionError


repr函数(用来取得对象的规范字符串表示)::

    i = []
    i.append('item')
    # repr函数
    repr(i)
    # 反引号（也称转换符）可以完成相同的功能
    `i`


第16章 接下来学习什么
--------------------------

