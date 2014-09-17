docker命令使用
=======================

* 文档: http://docs.docker.com/
* docker的cloud查询: https://registry.hub.docker.com
* docker管理: https://hub.docker.com/

常见命令::

    $ docker            # 查看命令列表
    $ docker version    # 查看版本

    $ docker images        # 查看image列表

    $ docker run ubuntu:14.04 /bin/cat /etc/issue   # 执行docker命令

    $ docker run -t -i ubuntu:14.04 /bin/bash   # shell登陆 -t(--tty=true) and -i(--interactive=true)

后台运行::

    # 后台执行命令 -d: 后台运行
    $ docker run -d ubuntu:14.04 /bin/sh -c "while true; do echo hello world; sleep 1; done"
    1e5535038e285177d5214659a068137486f96ee5c2e85a4ac52dc83f2ebe4147
    # 查看docker的进程(只能查看running的进程)
    $ docker ps
    CONTAINER ID  IMAGE         COMMAND               CREATED        STATUS       PORTS NAMES
    1e5535038e28  ubuntu:14.04  /bin/sh -c 'while tr  2 minutes ago  Up 1 minute        insane_babbage

查看日志::

    # 查看日志
    $ docker logs insane_babbage   # insane_babbage是上面ps的names
    # -f: --follow, 跟踪日志
    $ docker logs -f insane_babbage


常见命令::

    # 停止此进程
    $ docker stop insane_babbage
    # 删除container
    $ sudo docker rm nostalgic_morse

    # 连接到container
    $ docker attach      # 查看attach命令的使用
    $ docker attach <container>

    # 查看container进程
    $ sudo docker top nostalgic_morse

    # inspect container全部信息
    $ sudo docker inspect nostalgic_morse
    # 只查看ip地址
    $ sudo docker inspect -f '{{ .NetworkSettings.IPAddress }}' nostalgic_morse
    172.17.0.5
    # 查看container's name
    $ sudo docker inspect -f "{{ .Name }}" aed84ee21bde
    /web


    // 查看images列表
    $ sudo docker images

把docker当git使用::

    // 获取一个新的images
    $ sudo docker pull centos
    // 查询指定images
    $ sudo docker search sinatra

    // 提交commit: -m: 消息内容, -a: 提交者
    // Usage: docker commit [OPTIONS] CONTAINER [REPOSITORY[:TAG]]
    $ sudo docker commit -m="Added json gem" -a="Kate Smith" 0b2616b0e5a8 zhaoweiguo/sinatra:v2


删除images::

    $ sudo docker rmi training/sinatra


container linking::

    # 从images为training/postgres上创建一个名为db的container
    $ sudo docker run -d --name db training/postgres
    # 创建一个名为web的container链接到名为db的container
    # --link <name>:<alias>:
    #     <name>:  为要被链接的container的name
    #     <alias>: 是这个<name>的别名
    $ sudo docker run -d -P --name web --link db:db training/webapp python app.py

docker volume::

    # -v, --volume=[]  
    # e.g.: from the host: -v /host:/container, from Docker: -v /container(注意host后的:)
    # -v可以被多次使用
    $ sudo docker run -d -P --name web -v /webapp training/webapp python app.py

    # Mount a Host Directory as a Data Volume
    $ sudo docker run -d -P --name web -v /src/webapp:/opt/webapp training/webapp python app.py
    # 新建一个read-only类型的volume:
    $ sudo docker run -d -P --name web -v /src/webapp:/opt/webapp:ro training/webapp python app.py








运行web服务器::

    // -P: --publish-all, map显露全部网络端口
    $ sudo docker run -d -P training/webapp python app.py
    // -l: latest,最近的container
    $ sudo docker ps -l
    // -p: --publish=[<format>]
    // format: ip:hostPort:containerPort | ip::containerPort | hostPort:container
    $ sudo docker run -d -p 5000:5000 training/webapp python app.py
    // udp模式
    $ sudo docker run -d -p 127.0.0.1:5000:5000/udp training/webapp python app.py


    // 查看某container的指定port绑定的本地port
    $ sudo docker port nostalgic_morse 5000
    0.0.0.0:49154



* $ docker --help::

    Usage: Docker [OPTIONS] COMMAND [arg...]
    -H="127.0.0.1:4243": Host:port to bind/connect to
    
    A self-sufficient runtime for linux containers.
    
    Commands:
    
    attach    Attach to a running container
    build     Build a container from a Dockerfile
    commit    Create a new image from a container's changes
    diff      Inspect changes on a container's filesystem
    export    Stream the contents of a container as a tar archive
    history   Show the history of an image
    images    List images
    import    Create a new filesystem image from the contents of a tarball
    info      Display system-wide information
    insert    Insert a file in an image
    inspect   Return low-level information on a container
    kill      Kill a running container
    login     Register or Login to the Docker registry server
    logs      Fetch the logs of a container
    port      Lookup the public-facing port which is NAT-ed to PRIVATE_PORT
    ps        List containers
    pull      Pull an image or a repository from the Docker registry server
    push      Push an image or a repository to the Docker registry server
    restart   Restart a running container
    rm        Remove a container
    rmi       Remove an image
    run       Run a command in a new container
    search    Search for an image in the Docker index
    start     Start a stopped container
    stop      Stop a running container
    tag       Tag an image into a repository
    version   Show the Docker version information
    wait      Block until a container stops, then print its exit code

    

* $ docker run::

    Usage: Docker run [OPTIONS] IMAGE COMMAND [ARG...]

    Run a command in a new container
    
    -a=map[]: Attach to stdin, stdout or stderr.
    -c=0: CPU shares (relative weight)
    -d=false: Detached mode: leave the container running in the background
    -dns=[]: Set custom dns servers
    -e=[]: Set environment variables
    -h="": Container host name
    -i=false: Keep stdin open even if not attached
    -m=0: Memory limit (in bytes)
    -p=[]: Expose a container's port to the host (use 'docker port' to see the actual mapping)
    -t=false: Allocate a pseudo-tty
    -u="": Username or UID
    -v=map[]: Attach a data volume
    -volumes-from="": Mount volumes from the specified container



Dockerfile文件
-----------------
实例::

    # This is a comment
    FROM ubuntu:14.04
    MAINTAINER Kate Smith <ksmith@example.com>
    RUN apt-get update && apt-get install -y ruby ruby-dev
    RUN gem install sinatra

使用Dockerfile文件::

    // -t: --tag=""
    // 使用 . 指定是当前目录的Dockerfile文件
    $ sudo docker build -t="zhaoweiguo/sinatra:v2" .
    // 这时使用docker images可以查看到zhaoweiguo/sinatra:v2的images

    // 为已存在的images加tag:
    $ sudo docker tag 5db5f8471261 zhaoweiguo/sinatra:devel
    // 查看指定images的tag列表
    $ sudo docker images ouruser/sinatra

    // 把images push到Docker Hub上
    $ sudo docker push ouruser/sinatra

Dockerfile文件说明
----------------------
* https://docs.docker.com/reference/builder/

FROM::

    # 指定image来源
    FROM <image>
    FROM <image>:<tag>
    e.g. FROM zhaoweiguo/utuntu:12.02

MAINTAINER::

    # 设定维护者
    MAINTAINER <name>


RUN::

    # 运行命令，会保存cache与ADD命令对应
    RUN <command>
    RUN ["executable", "param1", "param2"]
    e.g. RUN ["/bin/bash", "-c", "echo hello"]

CMD::

    # The main purpose of a CMD is to provide defaults for an executing container. 
    CMD ["executable", "param1", "param2"]    # (like an exec, this is the preferred form)
    CMD ["param1","param2"]       #  (as default parameters to ENTRYPOINT)
    CMD command param1 param2     #  (as a shell)
    e.g. CMD echo "This is a test." | wc -
    e.g. CMD ["/usr/bin/wc","--help"]
    Note: don't confuse RUN with CMD. RUN actually runs a command and commits the result; CMD does not execute anything at build time, but specifies the intended command for the image.

EXPOSE::

    # 监听指定网络端口,用于container间使用dockerlinks
    EXPOSE <port> [<port>...]

ENV::

    # 设定环境变量environment
    ENV <key> <value>
    # 可以通过docker inspect查看这些值
    # 可以通过docker run --env <key>=<value>修改这些值
    e.g. ENV DEBIAN_FRONTEND noninteractive   # will persist when the container is run interactively; for example: docker run -t -i image bash

ADD::

    # 拷贝一个宿主机上的文件<src>到container的<dest>目录下
    ADD <src> <dest>
    # @todo 还有好多信息

COPY::

    # 貌似和ADD命令差不大功能
    COPY <src> <dest>

ENTRYPOINT::

    # 一个Dockerfile文件中只能有一个ENTRYPOINT
    # 如果有ENTRYPOINT那么整个container可看作一个executable文件
    # 执行的命令不会被docker run覆盖(与CMD不同)
    ENTRYPOINT  ["executable", "param1", "param2"]   # (like an exec, the preferred form)
    ENTRYPOINT command param1 param2    # (as a shell)

VOLUME::

    # 磁盘挂载
    VOLUME ["/data"]
    VOLUME /var/log

USER::

    # sets the user name or UID
    USER daemon

WORKDIR::

    # 工作目录
    WORKDIR /path/to/workdir
    e.g.:
    WORKDIR /a
    WORKDIR b
    WORKDIR c
    RUN pwd
    # /a/b/c

ONBUILD::

    ONBUILD [INSTRUCTION]



* 实例:

.. literalinclude:: ./files/Dockerfile
   :language: mysql
   :linenos:










