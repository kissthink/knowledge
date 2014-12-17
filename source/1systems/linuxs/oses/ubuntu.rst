.. _os_ubuntu:

ubuntu专用命令
================
目录:

.. toctree::
   :maxdepth: 2

   ubuntu/debain_server
   ubuntu/necessary
   ubuntu/apt-get
   ubuntu/aptitude
   ubuntu/dpkg




* dpkg命令的使用::

    sudo dpkg -i wiznote_1.0-1_i386.deb


* Backports:

    Backports默认在ubuntu11.10(不包括)之前的版本是关闭的。因为在这些版本中,在从Backport安装包之前必须手工开启Backports.
    详情察看 `这儿 <https://help.ubuntu.com/community/UbuntuBackports#Enabling_Backports>`_




在ubuntu下close laptop lid, 不执行任何操作
----------------------------------------------------
::

    Alt + F2 and enter this: gconf-editor 
    apps > gnome-power-manager > buttons
    Set lid_ac and lid_battery to nothing

    OR

    1.When on AC Power, do nothing when laptop lid is closed: 
    gconftool-2 -t string -s /apps/gnome-power-manager/buttons/lid_ac nothing 

    2.When on Battery Power, do nothing when laptop lid is closed: 
    gconftool-2 -t string -s /apps/gnome-power-manager/buttons/lid_battery nothing 




    
