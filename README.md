# zeek-spicy-postgresql

This is Zeek 8.0's PostgreSQL parser extracted from the Zeek tree as zkg package
for use with Zeek 7.0.

## Tested as follows

    docker run --rm -it zeek/zeek:7.0
    root@4cce326eea43:/# apt-get update && apt-get install cmake libpcap-dev libssl-dev build-essential0wj
    root@4cce326eea43:/# zkg install https://github.com/awelzel/zeek-spicy-postgresql

    The following packages will be INSTALLED:
      https://github.com/awelzel/zeek-spicy-postgresql (main)

    Proceed? [Y/n] Y
    Running unit tests for "https://github.com/awelzel/zeek-spicy-postgresql"
    Installing "https://github.com/awelzel/zeek-spicy-postgresql".....................

    root@4cce326eea43:/# zeek LogAscii::use_json=T packages -r /usr/local/zeek/var/lib/zkg/scratch/zeek-spicy-postgresql/tests/traces/psql-create-insert-select-delete-drop.pcap
    root@4cce326eea43:/# head postgresql.log
    {... "user":"postgres","database":"postgres","application_name":"psql","frontend":"startup","backend":"auth_ok","backend_arg":"SASL,SASLContinue,SASLFinal","success":true}
    {... "user":"postgres","database":"postgres","application_name":"psql","frontend":"simple_query","frontend_arg":"DROP TABLE IF EXISTS t;","backend_arg":"SeverityLocalized=NOTICE,Severity=NOTICE,Code=00000,Message=table \"t\" does not exist, skipping,File=tablecmds.c,Line=1300,Routine=DropErrorMsgNonExistent","success":true,"rows":0}
    {... "user":"postgres","database":"postgres","application_name":"psql","frontend":"simple_query","frontend_arg":"CREATE TABLE IF NOT EXISTS t (i int, s varchar, t time);","success":true,"rows":0}
    {... "user":"postgres","database":"postgres","application_name":"psql","frontend":"simple_query","frontend_arg":"INSERT INTO t VALUES (42, 'forty-two', now());","success":true,"rows":0}
    {... "user":"postgres","database":"postgres","application_name":"psql","frontend":"simple_query","frontend_arg":"INSERT INTO t VALUES (86, 'eighty-six', now());","success":true,"rows":0}
    {... "user":"postgres","database":"postgres","application_name":"psql","frontend":"simple_query","frontend_arg":"SELECT * from t;","success":true,"rows":2}
    {... "user":"postgres","database":"postgres","application_name":"psql","frontend":"simple_query","frontend_arg":"DELETE FROM t;","success":true,"rows":0}
    {... "user":"postgres","database":"postgres","application_name":"psql","frontend":"simple_query","frontend_arg":"DROP TABLE t;","success":true,"rows":0}
    {... "user":"postgres","database":"postgres","application_name":"psql","frontend":"terminate"}

## Have fun!
