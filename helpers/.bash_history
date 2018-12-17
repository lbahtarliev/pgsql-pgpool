pwd
ls -lah
nano .bash_profile 
cl
exi
exit
cl
ls
ls -lah
cd 10/
ls
exit
sudo tail /var/log/messages 
tail /var/log/messages 
cl
ls
cl
exit
ls
cd 10/
ls
mv data data_new
ls
nano ~/.bash_profile 
exit
cl
cd 10
ls
mkdir data_new/
mkdir data
ls
pg_ctl --help
man pg_ctl
man 1 initdb
nano /usr/bin/pgpool_setup 
cl
ls
ls -lah data
pg_ctl initdb --no-locale -E UTF_8 --data-checksums -D data/
pg_ctl --no-locale -E UTF_8 --data-checksums initdb -D data/
pg_ctl initdb -E UTF_8 --data-checksums -D data/
pg_ctl --help
pg_ctl initdb --help
man 1 initdb
initdb --no-locale -E UTF_8 --data-checksums --pgdata data/
ls -lah data
mv data/*.conf .
mv data_new/* data/
ls -lah data_new/
mv *.conf data_new/
ls
cd data
ls
cd ..
exit
cd 10
ls
mv data_new/pg_ident.conf data/
mv data_new dist_confs
ls
cl
lsnetports 
ps auxfw
ls
ls etc/
nano etc/pgpool.conf
exit
ls
exit
history
ls
cd 10
ls
nano data/basebackup.sh 
nano data/postgresql.conf 
ls
ssh-keyscan 
ssh-keygen 
cl
ssh-copy-id 10.22.2.9
ssh-copy-id 10.22.2.8
cl
ssh 10.22.2.9
ssh 10.22.2.8
w
ls
ls -lah
cd
ls -lah
ls -lah .ssh/
ls -lah .ssh/authorized_keys 
cat .ssh/authorized_keys 
cp /dev/null .ssh/authorized_keys 
cl
ssh-copy-id 10.22.2.8
ssh 10.22.2.8
cat .ssh/authorized_keys 
ls
cat .ssh/known_hosts 
cd 10
ls
cd data/
ls
cd ..
psql -p 11000
exit
cd 10/
ls
./info_pgpool.sh 
nano info_pgpool.sh 
psql -p 11000
./info_pgpool.sh 
ls
cat pcppass 
pcp_pool_status 
pcp_pool_status -p 11001 -h localhost -w 
passwd
exit
cl
pcp_pool_status -p 11001 -h localhost -w 
pcp_pool_status -p 11001 -h localhost
pcp_pool_status -p 11001 -h localhost -w 
pcp_pool_status --help
man pcp_common_options
man pcp_recovery_node 
pcp_recovery_node --help
ls -lah
exit
ls
ls -lah
ls -lah 10/
cat 10/pcppass 
nano pcpass
cl
pcp_pool_status -p 11001 -h localhost -w 
ls
mkdir 10-dev
cd 10-dev/
ls
mkdir data
../10/setup_pgpool.sh data/
which pgpool_setup
nano ../10/setup_pgpool.sh 
cl
../10/setup_pgpool.sh data/
../10/setup_pgpool.sh
rm -rfv data/
ls
cl
../10/setup_pgpool.sh
ls -lah
cat bashrc.ports 
cp bashrc.ports ../
cd ..
ls
cl
nano bashrc.ports 
cat 10-dev/pcppass 
cp 10-dev/pcppass .
cl
nano bashrc.ports 
cl
pcp_pool_status -p 11001 -h localhost -w 
pcp_pool_status -p 11001 -h localhost
pcp_node_info 
pcp_node_info -n0
pcp_node_info -n0 -p 11001
. bashrc.ports 
pcp_node_info -n0 -p 11001
pcp_node_info -n0 -p 11001 -h localhost -w
pcp_recovery_node -p 11001 -h localhost -w -v -n1
ls 10/data/
chmod +x -v 10/data/*.sh
chmod +x -v 10/data/pgpool_remote_start 
cl
pcp_recovery_node -p 11001 -h localhost -w -v -n1
ifconfig ens192 | grep inet | cut -f2
ifconfig ens192 | grep "inet " | awk '{print $2}'
nano 10/data/basebackup.sh 
exit
ls
nano 10/data/postgresql.conf 
nano 10/etc/pgpool.conf
exit
ls
ls 10/
ls 10/etc/
chmod +x 10/etc/*.sh
ls 10/etc/
cl
lsnetports 
pcp_recovery_node -p 11001 -h localhost -w -v -n1
ls
. bashrc.ports 
cat bashrc.ports 
cl
pcp_recovery_node -p 11001 -h localhost -w -v -n1
cd 10
ls
./info_pgpool.sh 
nano info_pgpool.sh 
cl
./info_pgpool.sh 
psql
./info_pgpool.sh 
lsnetports 
ls
lsnetports 
exit
nano 10/etc/pgpool.conf
cl
exit
nano 10/etc/pgpool.conf
cl
exit
ls
./10/info_pgpool.sh 
ls /var/www/html/
pcp_recovery_node -p 5433 -h localhost -w -v -n1
nano .bash_profile 
cl
exit
cl
pcp_recovery_node -p 5433 -h localhost -w -v -n1
env
ls
nano pcppass 
nano pcpass 
nano bashrc.ports 
nano pcppass 
echo postgres | md5sum 
nano pcpass 
nano pcppass 
cl
exit
cl
env
cl
pcp_recovery_node -p 5433 -h localhost -w -v -n1
nano pcppass 
pcp_recovery_node -p 5433 -h localhost -w -v -n1
lsnetports 
./10/info_pgpool.sh 
ls 10
mv 10/*.sh .
ls
cl
./info_pgpool.sh 
psql
cl
./info_pgpool.sh 
nano info_pgpool.sh 
./info_pgpool.sh 
nano info_pgpool.sh 
./info_pgpool.sh 
nano info_pgpool.sh 
exit
./info_pgpool.sh 
cd 10
ls
cl
ls
tar zcvf pgpool_confs.tgz etc/ log/ run/ sbin/ pcppass 
scp pgpool_confs.tgz 10.22.2.9:~/10
cl
nano etc/pgpool.conf
cl
ipaddr 
cl
exit
cl
./info_pgpool.sh 
lsnetports 
psql template1
nano /usr/pgpool-10/bin/pgpool_setup 
nano init_sql.sh
chmod +x init_sql.sh 
./init_sql.sh 
nano init_sql.sh
./init_sql.sh 
psql
nano init_sql.sh
cl
./init_sql.sh 
nano init_sql.sh
cl
pcp_recovery_node -p 5433 -h localhost -w -v -n1
./in
./info_pgpool.sh 
exit
pg_ctl -D 10/data -m fast stop
./info_pgpool.sh 
pcp_recovery_node -p 5433 -h localhost -w -v -n0
bg
tail /var/log/messages 
sudo tail /var/log/messages 
sudo tail /var/log/messages -n 100
ssh 10.22.2.8
ssh-copy-id 10.22.2.8
ssh 10.22.2.8
cat .ssh/authorized_keys 
sudo systemctl restart openssh-server
sudo systemctl restart sshd
ssh 10.22.2.8
restorecon -Rv ~/.ssh 
ssh 10.22.2.8
lsnetports 
w
cl
pcp_recovery_node -p 5433 -h localhost -w -v -n0
bg
tail /var/log/messages -n 100
sudo tail /var/log/messages -n 100
ls
sudo tail /var/log/messages -n 100
sudo tail /var/log/messages -n 100 -f
./in
./info_pgpool.sh 
exit
nano 10/data/basebackup.sh 
nano 10/data/recovery.conf 
pg_ctl -D 10/data reload
tail -f 10/data/log/pgsql-Sun.log 
pg_ctl -D 10/data restart
tail -f 10/data/log/pgsql-Sun.log 
./info_pgpool.sh 
ls
ls 10/log/
cat 10/log/recovery.log 
tail -f 10/data/log/pgsql-Sun.log 
nano 10/etc/failover.sh 
cl
ipaddr 
lsnetports 
./in
./info_pgpool.sh 
cl
nano 10/data/basebackup.sh 
cl
./info_pgpool.sh 
cl
./info_pgpool.sh 
cl
./in
./info_pgpool.sh 
cl
pcp_recovery_node -p 5433 -h localhost -w -v -n1
./info_pgpool.sh 
pg_ctl -D 10/data -m fast stop
./info_pgpool.sh 
pcp_recovery_node -p 5433 -h localhost -w -v -n0
lsnetports 
pg_ctl -D 10/data -m fast stop
lsnetports 
cl
pcp_recovery_node -p 5433 -h localhost -w -v -n0
./info_pgpool.sh 
cat 10/data/recovery.conf 
./info_pgpool.sh 
ipaddr 
lsnetports 
nano 10/data/basebackup.sh 
cl
./info_pgpool.sh 
pg_ctl -D 10/data -m fast stop
cl
sudo tail -f /var/log/messages 10/data/log/pgsql-Sun.log
./info_pgpool.sh 
ipaddr 
pcp_recovery_node -p 5433 -h localhost -w -v -n1
./info_pgpool.sh 
nano info_pgpool.sh 
psql --help
nano info_pgpool.sh 
cl
./info_pgpool.sh 
nano info_pgpool.sh 
./info_pgpool.sh 
nano info_pgpool.sh 
./info_pgpool.sh 
nano info_pgpool.sh 
./info_pgpool.sh 
nano info_pgpool.sh 
cl
./info_pgpool.sh 
nano info_pgpool.sh 
./info_pgpool.sh 
nano info_pgpool.sh 
cl
./info_pgpool.sh 
exit
cl
./info_pgpool.sh 
ipaddr 
ls
ls 10
ls -lh 10/data/
ls
cd 10-dev/
ls -l
ls -lah data0/
cd ..
nano /usr/pgpool-10/bin/pgpool_setup 
cl
./info_pgpool.sh 
nano /usr/pgpool-10/bin/pgpool_setup 
cl
nano info_pgpool.sh 
./info_pgpool.sh 
psql --help
nano info_pgpool.sh 
cl
./info_pgpool.sh 
man psql
nano info_pgpool.sh 
cl
./info_pgpool.sh 
nano info_pgpool.sh 
./info_pgpool.sh 
python -V
sudo yum search pip
sudo yum search python 
sudo yum search python3 
exit
ls
nano info_pgpool.sh 
pip install psycopg2
pip install -U psycopg2
pip install --user psycopg2
pip install --user sqlalchemy
cl
ls
nano get_info.py
python -i get_info.py 
nano get_info.py
cl
python -i get_info.py 
cat info_pgpool.sh 
fg
cat info_pgpool.sh 
fg
cl
ls -lah
python -i get_info.py 
exit
