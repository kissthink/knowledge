.. _mysql_appendix_glossary:

附录F. 词汇表
===================

hot backup
--------------------
::

    A backup taken while the database and is running and applications are reading and writing to it. The backup involves more than simply copying data files: it must include any data that was inserted or updated while the backup was in process; it must exclude any data that was deleted while the backup was in process; and it must ignore any changes that were not committed.

warm backup
------------------
::

    A backup taken while the database is running, but that restricts some database operations during the backup process. For example, tables might become read-only. For busy applications and web sites, you might prefer a hot backup.
