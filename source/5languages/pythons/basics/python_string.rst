.. _python_string:

python字符串处理
############################

字符串截取::

    str = '12345678'
    print str[0:1]
    >> 1             # 输出str位置0开始到位置1以前的字符
    print str[1:6]
    >> 23456         # 输出str位置1开始到位置6以前的字符
    num = 18
    str = '0000' + str(num)# 合并字符串
    print str[-5:]   # 输出字符串右5位
    >> 00018


字符串替换::

    str = 'akakak'
    str = str.replace('k',' 8')      # 将字符串里的k全部替换为8
    print str
    >> 'a8a8a8'# 输出结果

字符串查找::

    str = 'a,hello'
    print str.find('hello')      # 在字符串str里查找字符串hello
    >> 2# 输出结果



字符分割::

    str = 'a,b,c,d'
    strlist = str.split(',')     # 用逗号分割str字符串，并保存到列表


字符合并::

    sep=":"
    items=sep.join(strlist)
    print items       # 'a:b:c:d'

