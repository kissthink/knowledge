

string模块
###################

chr(String, Character) -> Index
-----------------------------------------
* Types::

    String = string()
    Character = char()
    Index = integer() >= 0

* Desc:

Return the index of first/last occurrence of Character in String. 0 returned if the character does not occur.


tokens(String, SeparatorList) -> Tokens
-------------------------------------------------
* Types::

    String = SeparatorList = string()
    Tokens = [Token :: nonempty_string()]

* Desc:

Return a list of tokens in ``String`` , separated by the characters in ``SeparatorList`` .

* Example::

    % 按空格or字符x分割
    > tokens("abc defxxghix jkl", "x ").
    ["abc", "def", "ghi", "jkl"]




