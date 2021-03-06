.. _sed:

sed的使用方法
========================

格式::

    sed [-nefr] [n1, n2] action

* 参数介绍:

    .. option:: -n, --quiet, --silent

       安静模式，只有经过Sed处理过的行才显示出来，其他不显示

    .. option:: -e script, --expression=script

       表示直接在命令行上进行Sed操作，默认选项，不用写

    .. option:: -f script-file, --file=script-file

       将Sed操作写在一个文件里,用的时候-f filename就可以按照内容进行Sed操作了

    .. option:: -i[SUFFIX], --in-place[=SUFFIX]

       直接在文件中编辑(和 ``-f`` 参数不同点在于, 它直接在文件中替换) (makes backup if extension supplied)

    .. option:: -r, --regexp-extended

       表示Sed支持扩展正则表达式


* [n1, n2]选项:

不一定需要, 选择要处理的行。如10，20表示在10~20行之间处理

* action选项支持如下参数:

    * a: 表示添加，后接字符串，添加到当前行的下一行
    * c: 表示替换，后接字符串，用它替换n1到n2之间的行
    * d: 表示删除符合模式的行，它的语法为 ``sed '/regexp/d'``, 斜杠之间是正则表达式，模式在d前面，d后面一般不接受任何内容
    * i: 表示插入，后接字符串，添加到当前行的上一行
    * p: 表示打印，打印某一选择的数据，通常与 ``-n`` 选项一同使用
    * s: 表示搜索，还可以替换，类似于Vim里的搜索替换功能。例如: ``1,20s/old/new/g`` 表示替换1~20行的old为new，g在这儿表示处理这一行所有匹配的内容

简单实例
''''''''''''''''

删除("."表示任意字元; "*" 表示其前字元可重任意次 , 它们结合 ".*" 表示两 "t" 字母间的任意字串)::

    10d   //删除档内第 10 行资料
    /man/d    //删除含有 "man" 字串的资料行
    10,200d   //删除档内第 10 行到第 200 行资料
    10,/man/d    //删除档内第 10 行到含 "man" 字串的资料
    /t.*t/d    //删除所有含两 "t" 字母的资料行
    /apple/,/orange/d

文件操作
''''''''''''

将文件中含 "machine" 字串的资料行中的 "phi" 字串 , 替换成为 "beta" 字串。其命令列如下::

    sed -e '/machine/s/phi/beta/g' input.dat

将文件中第 5 行资料 , 替换成句子 "Those must often wipe a bloody nose"::

    sed -e '5c Those must often wipe a bloody nose' input.dat

将文件中 1 至 100 行的资料区 , 替换成如下两行资料aaaa\nbbbb::

    sed -e '1,100c aaaa\nbbbb' input.dat

将文件中含 "phi" 字串的资料行 , 搬至 mach.inf 档中储存::

    sed -e '/phi/w mach.inf' <文档>

将 ``mach.inf`` 文件内容 , 搬至<文档>中含 "beta" 字串的资料行::

    sed -e '/beta/r mach.inf' <文档>



删除文件中的资料
''''''''''''''''''''

将文件内所有空白行全部删除::

    sed -e '/^$/d' <文档>

将文件内连续的空白行, 删除它们成为一行::

     sed -e '/^$/{ 
        N 
        /^$/D  
     }' <文档>
     # 函数参数 N表示: 将空白行的下一行资料添加至pattern space内
     # 函数参数 /^$/D 表示: 当添加的是空白行时, 删除第一行空白行, 而且剩下的空白行则再重新执行指令一次
     # 指令重新执行一次, 删除一行空白行, 如此反覆直至空白行後添加的为非空白行为止, 故连续的空白行最後只剩一空白行被输出

搜寻文件中的资料
--------------------

将文件中含有 "gamma" 字串的资料行输出::

    sed -n -e '/gamma/p' <文档>




使用 ``-f`` 选项操作
''''''''''''''''''''''''''

将文件中的前 100 资料, 搬到文件中第 300 後输出。其命令列如下::

    sed -f mov.scr <文档>
    # mov.scr的内容为
    1,100 {
       H 
       d 
    }
    300G
    # 它表示将文件中的前100资料 , 先储存在 hold space,後删除
    # 将 hold space 内的资料 , 添加在文件中的第300




实例
'''''''''

显示passwd内容，将2~5行删除后显示::

    cat -n /etc/passwd | sed '2,5d'

在第2行后面加上Hello China字符串::

    cat -n /etc/passwd | sed '2a Hello China'

将2~5行的内容替换为“Hello China”::

    cat -n /etc/passwd | sed '2,5c Hello China'

只显示5~7行，注意 ``p,-n`` 的配合使用::

    cat -n /etc/passwd | sed -n '5,7p'

得到eth0的ip(``^.* addr://g'`` 指把从开头到addr:的替换为空, ``s/Bcast.*$//g`` 指把以Bcast开头的到最后的替换为空)::

    ifconfig eth0 | grep 'inet ' | sed 's/^.* addr://g' | sed 's/Bcast.*$//g'

删除 yel.dat 内 1 至 10 行资料 , 并将其余文字中的 "yellow" 字串改成 "black" 字串::

    sed -e '1,10d' -e 's/yellow/black/g' yel.dat

打印出 white.dat 档内含有 "white"字串的资料行::

    sed -n -e '/white/p' white.dat

把文件 ``<fileName>`` 中手机号前面有区号的区号去掉(注意直接使用 ``\2`` 就是取第二个)::

    sed -e 's/\(0[0-9]\{2,3\}\)\([0-9]\{11\}\)/0\2/g' ./<fileName>

把文件 ``<fileName>`` 中的 ``($session[0]['id']`` 修改为 ``($session[0]['user_id']``::

    sed -i "s/(\$session\[0]\['id']/(\$session\[0]\['user_id']/g" ./<fileName>



