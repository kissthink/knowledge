docker命令使用
=======================

$ docker --help::

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

    

$ docker run::

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










