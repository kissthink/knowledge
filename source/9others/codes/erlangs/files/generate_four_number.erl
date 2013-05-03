-module(generate_four_number).

-export([generate/0]).
-export([generate/2]).

%%
%% 生成从0000到9999的字串并写入文件generate.txt中
%%
generate() ->
    generate(0, 10000).

%%
%% 通用函数
%%    生成从From到To的字串并写入文件generate.txt中
%%
generate(From, To) ->
    List = generate(To, From, []), %得到对应的这些字串的列表
    File="./generate.txt", %指定文件名
    {ok, F} = file:open(File, [append]), %使用append方式打开文件
    Fun = fun(Num) ->
        io:format(F, "~s~n", [Num])
    end,
    lists:foreach(Fun, List).% 把这些列表写入文件中

%%
%% 生成从对应列表并存放到List中
%%
generate(To, Now, List) ->
    case To-Now of
        0 ->
            List;
        _Other ->
            CompleNow = comple_to_four_number(Now),
            generate(To, add(Now), [ CompleNow | List])
    end.

%%数字加1
add(Num) ->
    Num+1.

%%实例数字到4位
comple_to_four_number(Num) ->
    StrNum = integer_to_list(Num),
    Len = length(StrNum),
    case Len of
        1 ->
            "000" ++ StrNum;
        2 ->
            "00" ++ StrNum;
        3 ->
            "0" ++ StrNum;
        4 ->
            StrNum
    end.
