.. _mongodb_simple:

MongoDB簡单用法
#######################

使用MongoDB客户端::

    mongo            # 启动客户端
    use <dbName>     #使用<dbName>数据库
    db               #查看当前所在数据库

    db.<tableName>.insert(<value>)      # 插入数据
    db.<tableName>.find()               # 查出所有数据
    db.<tableName>.findOne()            # 查处一条数据
    db.<tableName>.update(<newValue>, <oldValue>)     # 更新一条数据
    db.<tableName>.remove(<value>)      # 删除对应数据


