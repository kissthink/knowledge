docker命令使用
=======================

文档: http://docs.docker.com/
docker的cloud: https://registry.hub.docker.com
      https://hub.docker.com/

常见命令::

    $ docker            # 查看命令列表
    $ docker version    # 查看版本

    $ docker images        # 查看image列表

    $ docker run ubuntu:14.04 /bin/cat /etc/issue   # 执行docker命令

    $ docker run -t -i ubuntu:14.04 /bin/bash   # shell登陆 -t(--tty=true) and -i(--interactive=true)

    # 后台执行命令 -d: 后台运行
    $ docker run -d ubuntu:14.04 /bin/sh -c "while true; do echo hello world; sleep 1; done"
    1e5535038e285177d5214659a068137486f96ee5c2e85a4ac52dc83f2ebe4147
    # 查看docker的进程
    $ docker ps
    CONTAINER ID  IMAGE         COMMAND               CREATED        STATUS       PORTS NAMES
    1e5535038e28  ubuntu:14.04  /bin/sh -c 'while tr  2 minutes ago  Up 1 minute        insane_babbage
    # 查看日志
    $ docker logs insane_babbage
    # 停止此进程
    $ docker stop insane_babbage

    $ docker attach      # 查看attach命令的使用



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










