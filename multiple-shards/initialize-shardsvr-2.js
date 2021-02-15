rs.initiate( {
    _id : "rs2",
    members: [
       // default port is 27018 for shard servers
       { _id: 0, host: "mongodb-rs2-0:27018" },
    ]
 })