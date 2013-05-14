

内置类型
##################


.. option:: file.seek(offset[, whence])

   ::

       f.seek(2, os.SEEK_CUR)     //advances the position by two
       f.seek(-3, os.SEEK_END)    //sets the position to the third to last

.. option:: file.tell()

   返回file’s current position, 同 stdio‘s ftell()

