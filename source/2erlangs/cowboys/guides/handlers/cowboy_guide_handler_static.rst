

Static handlers
#########################

* Static handlers are a built-in REST handler for serving files


Usage
---------------


The following example routing serves all files found in the ``priv_dir/static/`` directory of the application::

    Dispatch = [
        {'_', [
            {"/[...]", cowboy_static, [
                {directory, {priv_dir, my_app, [<<"static">>]}},
                {mimetypes, {fun mimetypes:path_to_mimes/2, default}}
            ]}
        ]}
    ].

The following example will serve the ``priv/index.html`` file from the application::

    Dispatch = [
        {'_', [
            {"/", cowboy_static, [
                {directory, {priv_dir, my_app, []}},
                {file, "index.html"},
                {mimetypes, {fun mimetypes:path_to_mimes/2, default}}
            ]}
        ]}
    ].
