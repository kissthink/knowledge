.. _mongodb_simple:

MongoDB簡单用法
#######################

使用MongoDB客户端::

    mongo            # 启动客户端
    use <dbName>     #使用<dbName>数据库
    db               #查看当前所在数据库


数据插入
------------

格式::

    db.<tableName>.insert(<value>)      # 插入数据
    db.<tableName>.save(<value>)

实例::

    db.foo.insert({"bar" : "baz"})


数据查询
------------

格式::

    # 查出所有数据
    db.<tableName>.find()
    # 根据查询条件查询
    db.<tableName>.find({"key" : <value>})
    # 根据多个查询条件查询
    db.<tableName>.find({"key1" : <value1>, "key2" : <value2>})

    # 查询此表的数据条数
    db.<tableName>.count()
    # 查询此表按条件的数据条数
    db.<tableName>.find({<key>, <value>}).count()

    # 查询出限定条数的数据
    db.<tableName>.find({<key>, <value>}).limit(<count>)

    # 查出一条数据
    db.<tableName>.findOne()
    # 查出满足条件的一条数据
    db.<tableName>.findOne({<key>, <value>})

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

    # 添加书——"Learning Python and Mongo"
    db.users.update({"_id" : ObjectId("4217490312794ifdj344")}, 
        {"$set" : {"book" : "Learning Python and Mongo"} })
    # 修改书——"Effective Python Programming"
    db.users.update({"_id" : ObjectId("4217490312794ifdj344")},
        {"$set" : {"book" : "Learning Python and Mongo"} })
    # 删除书
    db.users.update({"_id" : ObjectId("4217490312794ifdj344")},
        {"$unset" : {"book" : 1}}

增加和减少::

    # 初始数据
    db.games.insert({"game" : "pinball", "user" : "gordon"})
    # 设定得分基数50
    db.games.update({"game" : "pinball", "user" : "gordon"}, {"$inc" : {"score" : 50}})
    # 得分增加100
    db.games.update({"game" : "pinball", "user" : "gordon"}, {"$inc" : {"score" : 100}})

数组修改器1($push)::

    # 初始数据($push的使用)
    db.games.insert({"game" : "pinball"})
    # 增加此游戏使用用户gordon
    db.games.update(({"game" : "pinball"}, {"$push" : {"users" : "gordon"}})
    # 增加此游戏使用用户leo
    db.games.update(({"game" : "pinball"}, {"$push" : {"users" : "leo"}})

其他::

    $ne
    $addToSet
    $each
    $pull——会将所有匹配的部分删掉
