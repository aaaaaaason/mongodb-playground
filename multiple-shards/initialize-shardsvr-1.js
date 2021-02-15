rs.initiate( {
    _id : "rs1",
    members: [
       // default port is 27018 for shard servers
       { _id: 0, host: "mongodb-rs1-0:27018" },
    ]
 })