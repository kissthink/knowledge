graphviz使用
==================

基本命令::

  dot example1.dot –Tpng –o example1.png

基本的 DOT 文件::

    graph example1 {
      Server1 -- Server2   // -- 定义了节点之间的联系
      Server2 -- Server3
      Server3 -- Server1
    }

有向的 DOT 文件::

    digraph example2 {
        Server1 -> Server2
        Server2 -> Server3
        Server3 -> Server1
    }

具有额外属性的图表::

    digraph example3 {
       Server1 -> Server2
       Server2 -> Server3
       Server3 -> Server1

       Server1 [shape=box, label="Server1\nWeb Server", fillcolor="#ABACBA", style=filled]
       Server2 [shape=triangle, label="Server2\nApp Server", fillcolor="#DDBCBC", style=filled]
       Server3 [shape=circle, label="Server3\nDatabase Server", fillcolor="#FFAA22",style=filled]
    }






