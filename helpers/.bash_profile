[ -f /etc/profile ] && source /etc/profile
[ -f ~/.bashrc ] && source ~/.bashrc
[ -f ~/bashrc.ports ] && source ~/bashrc.ports
PGDATA=/var/lib/pgsql/10/data
export PGDATA
export PATH=/usr/pgsql-10/bin:/usr/pgpool-10/bin:/var/lib/pgsql/.local/bin:$PATH
# If you want to customize your settings,
# Use the file below. This is not overridden
# by the RPMS.
[ -f /var/lib/pgsql/.pgsql_profile ] && source /var/lib/pgsql/.pgsql_profile
