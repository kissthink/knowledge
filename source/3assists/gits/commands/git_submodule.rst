git submodule命令
######################################

* set up the submodule the first time::

    cd ~/main
    git submodule add git://<submodule>.git ./subm
    git submodule update --init
    git commit ./subm -m "<commit>" 

* fetch submodule after cloning a repository::

    git clone git://<mainmodule>.git
    git submodule update --init

* pull upstream main repo changes and update submodule contents::

    git pull origin master
    git submodule update

* pull upstream changes to the submodules::

    cd ./subm
    git pull origin/master
    cd ..
    git commit ./subm -m "update submodule reference"

* Edit and commit file in your submodule::

    cd ./subm
    edit <file>
    git commit <file> -m "update <file>"
    cd ..
    git commit ./subm -m "update submodule reference"

* Push your submodule changes to the submodule stream::

    cd .subm
    git push origin master
















