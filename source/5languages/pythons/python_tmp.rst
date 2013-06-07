.. _python_tmp:

python收集
####################

python中获取当前位置所在的行号和函数名::

    def get_cur_info(): 
        print sys._getframe().f_code.co_name 
        print sys._getframe().f_back.f_lineno 

    get_cur_info()  




