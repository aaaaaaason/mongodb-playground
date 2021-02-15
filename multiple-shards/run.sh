MONGO_HOST=127.0.0.1
RS0_0_PORT=27017
RS1_0_PORT=27018
RS2_0_PORT=27019
CONFIG_PORT=27020
MONGOS_PORT=27021
DB_USER=root
DB_PASSWD=password

function connect {
    local host=$1
    local port=$2
    mongo --host=$host --port=$port \
    -u $DB_USER -p $DB_PASSWD \
    --authenticationDatabase=admin < $3
}

case $1 in 

restart)
    docker-compose down && docker-compose up -d
    ;;

rs0-0)
    connect $MONGO_HOST $RS0_0_PORT $2
    ;;

rs1-0)
    connect $MONGO_HOST $RS1_0_PORT $2
    ;;

rs2-0)
    connect $MONGO_HOST $RS2_0_PORT $2
    ;;

cfg-0)
    connect $MONGO_HOST $CONFIG_PORT $2
    ;;

mongos)
    connect $MONGO_HOST $MONGOS_PORT $2
    ;;

fix-keyfile)
    sudo chown 999:999 keyfile && sudo chmod 600 keyfile
    ;;

init)
    ./run.sh rs0-0 initialize-shardsvr-0.js &&
    ./run.sh rs1-0 initialize-shardsvr-1.js &&
    ./run.sh rs2-0 initialize-shardsvr-2.js &&
    ./run.sh cfg-0 initialize-configsvr.js &&
    echo "wait 30 secs for cluster to start..." &&
    sleep 30 &&
    ./run.sh mongos initialize-shard.js
    ./run.sh mongos assign-shard-to-zone.js
    ;;

esac