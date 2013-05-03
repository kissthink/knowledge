.. _dig:

dig命令
############
::

    dig @{ns1.example.com} {example.com}
    dig @{ns1.example.com} {example.com} {TYPE}
    dig cyberciti.biz a
    dig cyberciti.biz mx
    dig cyberciti.biz ns
    dig cyberciti.biz txt
    dig @ns1.nixcraft.net cyberciti.biz a


其他
---------------

::

    $ dig +trace cyberciti.biz          # Task: Trace Usage
    $ dig +short cyberciti.biz          # Task: Get Only Short Answer
    $ dig +noall +answer cyberciti.biz any      # Task: Display All Records
    $ dig -x +short {IP-Address-here}           # Task: Reverse IP Lookup
    $ dig +nssearch cyberciti.biz               # Task: Find Domain SOA Record
    $ dig +nocmd +noall +answer {TYPE} {example.com}    # Task: Find Out TTL Value Using dig



