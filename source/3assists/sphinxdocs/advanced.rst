.. _advanced:

高级命令
============
.. code-block:: matlab

    %DOCLINK - Provide windows dir HREF text(clipboard)
    
    string_temp_ahead = fullfile('jar:file:///', matlabroot, 'help');
    
    clipboard('copy', href_for_codelib);


::


    %DOCLINK - Provide windows dir HREF text(clipboard)
    
    string_temp_ahead = fullfile('jar:file:///', matlabroot, 'help');
    
    clipboard('copy', href_for_codelib);

.. code-block:: erlang

    -module(abc).
    -export([ex/0]).

    ex() ->
        ok.

.. _fig-numpyaccess2d:

.. figure:: image/photo.jpg
    :width: 2.0cm

    二维NumPy数组的下标存取



.. literalinclude:: ./files/test_language.txt
    :language: sh
    :emphasize-lines: 12,15-18 
    :linenos:
