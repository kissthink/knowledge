.. _mongodb_simple:

MongoDB簡单用法
#######################

使用MongoDB客户端::

    mongo            # 启动客户端
    show dbs         # 察看db列表
    use <dbName>     # 使用<dbName>数据库
    db               # 查看当前所在数据库
    show collections   # 查看此数据库的表列表

数据插入
------------

格式::

    db.<tableName>.insert(<value>)      # 插入数据
    db.<tableName>.save(<value>)

实例::

    db.foo.insert({"bar" : "baz"})


数据查询
------------

基本格式::

    # 查出所有数据
    db.<tableName>.find()
    # 根据查询条件查询
    db.<tableName>.find({"key" : <value>})
    # 根据多个查询条件查询
    db.<tableName>.find({"key1" : <value1>, "key2" : <value2>})


    # 查出一条数据
    db.<tableName>.findOne()
    # 查出满足条件的一条数据
    db.<tableName>.findOne({<key>, <value>})

指定返回的键::

    # 只取出表中字段为<key1>和<key2>的值
    db.<tableName>.find({}, {<key1> : 1, <key2> : 1})
    # 取出除字段<key>之外的表的数据
    db.<tableName>.find({}, {<key> : 0})

查询条件( ``$lt``, ``$lte``, ``$gt``, ``$gte`` 的使用 )::

    db.<tableName>.find({<key> : {"$gte" : <value1>, "$lte" : <value2>} } )

``$or``, ``$in`` 进行OR查询::

    # $in
    db.<tableName>.find({<key> : {"$in" : [<value1>, <value2>]}})
    # $or
    db.<tableName>.find({"$or" : [{<key1>:<value1>}, {<key2>:<value2>}]})

``$not`` 是元条件句, 即可以用在任何其他条件之上

查询表数据条数::

    # 查询此表的数据条数
    db.<tableName>.count()
    # 查询此表按条件的数据条数
    db.<tableName>.find({<key> : <value>}).count()

limit, skip, sort::

    # 查询出限定条数的数据
    db.<tableName>.find({<key> : <value>}).limit(<count>)

    # 排序
    db.<tableName>.find().sort(<key>, -1)    # 降序
    db.<tableName>.find().sort(<key>, 1)     # 升序

    # 忽略前<count>个匹配的文档,如果匹配的小于<count>则不返回任何文档
    db.<tableName>.find().skip(<count>)



数据删除
---------------

格式::

    db.<tableName>.remove(<value>)      # 删除对应数据

实例::

    db.mailing.list.remove({"opt-out" : true})


数据更新
--------------

格式::

    db.<tableName>.update(<newValue>, <oldValue>)     # 更新一条数据

文档替换::

    db.user.update({"_id" : ObjectId("4217490312794ifdj344")},
        {"book" : "Learning Python and Mongo"})

"$set"修改器::

    # 添加一本书——"Learning Python and Mongo"
    db.users.update({"_id" : ObjectId("4217490312794ifdj344")}, 
        {"$set" : {"book" : "Learning Python and Mongo"} })
    # 修改书名——"Effective Python Programming"
    db.users.update({"_id" : ObjectId("4217490312794ifdj344")},
        {"$set" : {"book" : "Learning Python and Mongo"} })
    # 删除书的信息
    db.users.update({"_id" : ObjectId("4217490312794ifdj344")},
        {"$unset" : {"book" : 1}}

增加和减少::

    # 初始数据
    db.games.insert({"game" : "pinball", "user" : "gordon"})
    # 设定得分基数50
    db.games.update({"game" : "pinball", "user" : "gordon"}, {"$inc" : {"score" : 50}})
    # 得分增加100
    db.games.update({"game" : "pinball", "user" : "gordon"}, {"$inc" : {"score" : 100}})

数组修改器1( ``$push`` 的使用)::

    # 初始数据
    db.games.insert({"game" : "pinball"})
    # 增加一个属性user, 值是一个数组里面有一个值:gordon
    db.games.update(({"game" : "pinball"}, {"$push" : {"users" : "gordon"}})
    # 往users字段中再增加一个用户leo
    db.games.update(({"game" : "pinball"}, {"$push" : {"users" : "leo"}})

数组修改器2( ``$pop`` 的使用)::

    # 从数组末尾删除一个元素
    db.game.update({"game" : "pinball"}, {"$pop" : {"users" : 1}})
    # 从数组开头删除一个元素
    db.game.update({"game" : "pinball"}, {"$pop" : {"users" : -1}})

数据修改器3( ``$pull`` 的使用)::

    # 把user中值为"gordon"的从列表中删除
    db.game.update({"game" : "pinball"}, {"$pull" : {"user" : "gordon"} } )

往数组增加数据时使用 ``$addToSet`` 可以避免重复::

    db.games.update({}, {"$addToSet" : {"user" : "gordon"}})   # 这条数据因为数据表里有数据而执行无效



组合使用
------------------

使用 ``$addToSet`` 和 ``$each`` 组合起来,可以添加多个不同的值::

    db.games.update(
       {"game" : "pinball"},     # 限定条件
       {"$addToSet" : {"users" :
          {"$each" : ["gordon", "joe", "andor"]}   # 要新增的列表
       } }
    )

其他::

    $ne

