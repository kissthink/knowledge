

list模块
################


split(N, List1) -> {List2, List3}
----------------------------------------
* Types::

    N = integer() >= 0
        0..length(List1)
    List1 = List2 = List3 = [T]
    T = term()

* Desc:

Splits ``List1`` into ``List2`` and ``List3`` . List2 contains the first N elements and the List3 contains the rest of the elements(the Nth tail).


to_integer(String) -> {Int, Rest} | {error, Reason}
-------------------------------------------------------------
* Types::

    String = string()
    Int = integer()
    Rest = string()
    Reason = no_integer | not_a_list

* Desc:

Argument ``String`` is excepted to start with a valid text represented integer(the digits being ASCII values). Remaining Characters in the String after the integer is returned in the ``Rest``

* Example::

    > {I1,Is} = string:to_integer("33+22"),
    > {I2,[]} = string:to_integer(Is),
    > I1-I2.
     11
    > string:to_integer("0.5").
     {0,".5"}
    > string:to_integer("x=2").
     {error,no_integer}



