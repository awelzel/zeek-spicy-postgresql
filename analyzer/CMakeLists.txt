spicy_add_analyzer(
    NAME PostgreSQL
    PACKAGE_NAME spicy-postgresql
    SOURCES postgresql.spicy postgresql.evt postgresql_zeek.spicy
    SCRIPTS __load__.zeek consts.zeek main.zeek spicy-events.zeek dpd.sig)
