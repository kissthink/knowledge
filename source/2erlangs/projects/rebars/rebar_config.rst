.. _rebar_config:

rebar配置文件
####################

::

    {app,[erldis]}.
    {erl_opts, [debug_info]}.

    {eunit_compile_opts, [{src_dirs, ["test"]}]}.
    {cover_enabled, true}.
    {clean_files, ["ebin/*.beam", "priv/log/*", "rel/*"]}.
    {target, "rel"}.
    {deps_dir, ["deps"]}.
    {deps, [

    ]}.
