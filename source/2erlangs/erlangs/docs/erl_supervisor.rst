

supervisor模块
########################

* The type definition of a child specification::

    child_spec() = {Id,StartFunc,Restart,Shutdown,Type,Modules}
     Id = term()
     StartFunc = {M,F,A}
       M = F = atom()
       A = [term()]
     Restart = permanent | transient | temporary
      Shutdown = brutal_kill | int()>0 | infinity
      Type = worker | supervisor
      Modules = [Module] | dynamic
        Module = atom()

* restart strategy

    .. option:: one_for_one

    * if one child process terminates and should be restarted, only that child process affected.

    .. option:: one_for_all

    * if one child process terminates and should be restarted, all the other processes are terminated and then all processes are restarted.

    .. option:: rest_for_one

    * if one child process terminates and should be restarted, the 'rest' of processes(the child processes after of the terminated child process in the start order) are terminated

    .. option:: simple_one_for_one

    * a simple one-for-one supervisor, where all processes are dynamically add instances of the same process type.
    * ``delete_child/2`` and ``restart_child/2`` is invalid for ``simple_one_for_one`` supervisor and return ``{error,simple_one_for_one} `` 



start_link(Module, Args) -> startlink_ret()
----------------------------------------------
同下, 只是没有注册名

start_link(SupName, Module, Args) -> startlink_ret()
----------------------------------------------------------

Creates a supervisor process as part of a supervision tree. The function will, among other things, ensure the supervisor is linked to the calling process(its supervisor).

SupName::

    {local,Name} - the supervisor is registered locally as Name using register/2
    {global,Name} - the supervisor is registered globally as Name using global:register_name/2
    {via,Module,Name} - the supervisor is registered as Name using registry represented by Module. The Module callback should export the function register_name/2 and unregister_name/1 and send/2



start_child(SupRef, ChildSpec) -> startchild_ret()
-------------------------------------------------------------

* Types::

    SupRef = sup_ref()
    ChildSpec = child_spec() | (List :: [term()])
    child_spec() = 
        {Id :: child_id(),
        StartFunc :: mfargs(),
        Restart :: restart(),
        Shutdown :: shutdown(),
        Type :: worker(),
        Modules :: modules()}
    startchild_ret() = {ok, Child :: child()}
                 | {ok, Child :: child(), Info :: term()}
                 | {error, startchild_err()}
    startchild_err() = already_present
                 | {already_started, Child :: child()}
                 | term()    


* Desc:

Dynamically adds a child specification to the supervisor SupRef which starts the corresponding child process.



