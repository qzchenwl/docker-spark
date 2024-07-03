#!/bin/bash

set -xe

cd "$(dirname $0)"

docker compose down

# reset volumes to empty state
sudo ./volumes/reset.sh

docker compose run --rm hadoop-namenode hdfs namenode -format -force -nonInteractive

# start namenode and create hive folder first
docker compose up hadoop-namenode hadoop-datanode hadoop-yarn-resourcemanager hadoop-yarn-nodemanager -d
sleep 10
docker compose exec -it hadoop-namenode hdfs dfs -mkdir -p /user/hive/warehouse
docker compose exec -it hadoop-namenode hdfs dfs -chmod -R 777 /user/hive
sleep 10

# start other services first time
IS_RESUME=false docker compose up -d
sleep 10

docker compose exec -it spark-master spark-sql -e $'
create database test_db;
use test_db;
create table test_table(id bigint, name string);
insert into test_table values (1, \'hello\'), (2, \'world\');
'
docker compose exec -it spark-master spark-sql -e 'select * from test_db.test_table;'

docker exec -it spark-thriftserver /opt/bitnami/spark/bin/beeline -u jdbc:hive2://localhost:10000 -e 'select * from test_db.test_table;'

