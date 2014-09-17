.. _other:

#####
其他
#####

**localer操作**

    * 操作::

        qii@ubuntu:~$ locale
        locale: Cannot set LC_CTYPE to default locale: No such file or directory
        locale: Cannot set LC_MESSAGES to default locale: No such file or directory
        locale: Cannot set LC_ALL to default locale: No such file or directory

    * 处理方法::

        /usr/share/locales/install-language-pack en_US
        export LC_CTYPE="en_US:UTF-8"


