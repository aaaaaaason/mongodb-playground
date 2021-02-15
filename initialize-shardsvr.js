rs.initiate( {
    _id : "rs0",
    members: [
       // default port is 27018 for shard servers
       { _id: 0, host: "mongodb-rs0-0:27018" },
       { _id: 1, host: "mongodb-rs0-1:27018" },
       { _id: 2, host: "mongodb-rs0-2:27018" }
    ]
 })