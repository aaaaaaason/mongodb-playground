rs.initiate( {
    _id : "rs0",
    members: [
       // default port is 27018 for shard servers
       { _id: 0, host: "mongodb-rs0-0:27018" },
    ]
 })