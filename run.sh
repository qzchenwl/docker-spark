#!/bin/bash

set -xe

docker compose down
docker compose up -d
sleep 20
docker exec -it spark-thriftserver /opt/bitnami/spark/bin/beeline -u jdbc:hive2://localhost:10000 -e 'select * from test_db.test_table;'
