MASTER_HOST=127.0.0.1
MASTER_PORT=27017

CONFIG_HOST=127.0.0.1
CONFIG_PORT=27020

MONGOS_HOST=127.0.0.1
MONGOS_PORT=27021

DB_USER=root
DB_PASSWD=password

case $1 in 

rs0-0)
    mongo --host=$MASTER_HOST --port=$MASTER_PORT \
    -u $DB_USER -p $DB_PASSWD \
    --authenticationDatabase=admin < $2
    ;;

cfg-0)
    mongo --host=$CONFIG_HOST --port=$CONFIG_PORT \
    -u $DB_USER -p $DB_PASSWD \
    --authenticationDatabase=admin < $2
    ;;

mongos)
    mongo --host=$MONGOS_HOST --port=$MONGOS_PORT \
    -u $DB_USER -p $DB_PASSWD \
    --authenticationDatabase=admin < $2
    ;;

fix-keyfile)
    sudo chown 999:999 keyfile && sudo chmod 600 keyfile
    ;;

init)
    ./run.sh rs0-0 initialize-shardsvr.js &&
    ./run.sh cfg-0 initialize-configsvr.js &&
    sleep 10 &&
    ./run.sh mongos initialize-shard.js
    ;;

esac