# @TEST-EXEC: zeek -r ${TRACES}/psql-aws-ssl-require-15432.pcap %INPUT
# @TEST-EXEC: zeek-cut -m uid user database application_name frontend frontend_arg backend backend_arg success rows < postgresql.log > postgresql.log.cut
# @TEST-EXEC: btest-diff postgresql.log.cut
#
# @TEST-EXEC: grep 'postgresql' conn.log
# @TEST-EXEC: test ! -f analyzer.log

@load analyzer
