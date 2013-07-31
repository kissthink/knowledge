.. _ibus_wubi:

Ubuntu系统中文输入法
===========================

* Ubuntu输入法情况

    * Ubuntu上的输入法有 `小小输入平台（支持拼音、二笔、五笔等) <http://yong.uueasy.com/thread-htm-fid-2.html>`_ , `Fcitx <http://wiki.ubuntu.org.cn/Fcitx>`_ , `ibus(中文环境默认输入法) <http://wiki.ubuntu.org.cn/IBus>`_ ，以及被淘汰的scim（和衍生品scim-python）、旧版本sunpinyin（可以作为ibus模块，也支持OS X）。其中SCIM、IBus是输入法框架，都是世界开发者共同维护的————起步都是中国开发者。
    * 不甚流行的 `firefox输入法扩展fireinput火输 <http://www.fireinput.com/main.php>`_
    * 此外还有非主流的非自由开源软件，比如智能ABC（仅授权特定国内Linux厂商使用）, `搜狗云输入法 <http://pinyin.sogou.com/cloud/>`_ , `QQ云输入法等 <http://py.qq.com/web/>`_

中文输入法fcitx
----------------------

Fcitx──小企鹅输入法：Free Chinese Input Toy for X是一个以GPL方式发布的、基于XIM的简体中文输入法集合（原为G五笔），包括五笔、五笔拼音、二笔、仓颉、晚风、冰蟾全息、拼音(全拼和双拼)、区位以及码表输入模块。

* fcitx 在中文环境下安装一般不会有什么问题（LC_CTYPE=zh_CN.UTF-8）. 在英文环境（LC_CTYPE=en_US.UTF-8）下安装，可按如下配置::

    > sudo apt-get install fcitx-pinyin im-switch
    > im-switch -s fcitx -z all_ALL

* 修改/etc/X11/xinit/xinput.d/fcitx，为::

    XIM=fcitx   
    XIM_PROGRAM=/usr/bin/fcitx
    XIM_ARGS=""
    GTK_IM_MODULE=fcitx
    QT4_IM_MODULE=fcitx
    DEPENDS="fcitx"

* 需要配置 gtk.immodules或immodules.cache文件(后一个是针对gnome3的):

    * 将::

        "xim" "X Input Method" "gtk20" "/usr/share/locale" "ko:ja:th:zh"

     改为::

        "xim" "X Input Method" "gtk20" "/usr/share/locale" "en:ko:ja:th:zh"

    * 将::

        "fcitx" "Fcitx (Free Chinese Input Toy of X)" "fcitx" "/usr/share/locale" "ja:ko:zh:*"

     更改为::

         "fcitx" "Fcitx (Free Chinese Input Toy of X)" "fcitx" "/usr/share/locale" "en:ja:ko:zh:*" 

* 上面两文件位置:

    * Debian用户::

        /usr/lib/x86_64-linux-gnu/gtk-2.0/2.10.0/gtk.immodules
        如果系统是gnome3
        /usr/lib/x86_64-linux-gnu/gtk-3.0/3.0.0/immodules.cache

    * 如果gtk.immodules文件没有，用户可以用sudo /usr/lib/x86_64-linux-gnu/libgtk2.0-0/gtk-query-immodules-2.0 > /usr/lib/x86_64-linux-gnu/gtk-2.0/2.10.0/gtk.immodules 生成 
    * 如果immodules.cache文件没有，可以用sudo /usr/lib/x86_64-linux-gnu/libgtk-3-0/gtk-query-immodules-3.0 > /usr/lib/x86_64-linux-gnu/gtk-3.0/3.0.0/immodules.cache 生成 

    * Ubuntu用户::

        /usr/lib/gtk-2.0/2.10.0/gtk.immodules
        如果系统是gnome3
        /usr/lib/gtk-3.0/3.0.0/immodules.cache/usr/lib/gtk-2.0/2.10.0/gtk.immodules

    * 如果gtk.immodules文件没有，Ubuntu用户可以用sudo gtk-query-immodules-2.0 >/usr/lib/gtk-2.0/2.10.0/gtk.immodules 生成
    * 如果immodules.cache文件没有，Ubuntu用户可以用sudo gtk-query-immodules-3.0 >/usr/lib/gtk-3.0/3.0.0/immodules.cache 生成 

* 参见 `中文输入法fcitx <http://wiki.ubuntu.org.cn/Fcitx>`_

中文输入法ibus
----------------------

IBus 全称 Intelligent Input Bus是下一代输入法框架（或者说“平台”）。 项目现托管于 Google Code - https://code.google.com/p/ibus/ 此项目包含了世界多数语言的文字输入需求——由世界多个国家开发者维护

    * 安裝IBus框架::

        sudo apt-get install ibus ibus-clutter ibus-gtk ibus-gtk3 ibus-qt4

    * 启用IBus框架::

        im-switch -s ibus

    * 安装拼音引擎::

        sudo apt-get install ibus-table-wubi

    * 设置IBus框架::

       ibus-setup

    * Kubuntu下使用IBus::

        sudo apt-get install gnome-icon-theme
        //其他同上

    * 找回消失的IBus图标::

        ibus-daemon -drx

    * 参见: `中文输入法ibus <http://wiki.ubuntu.org.cn/IBus>`_

