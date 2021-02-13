rs.initiate( {
    _id : "rs0",
    members: [
       { _id: 0, host: "mongodb-rs0-0:27017" },
       { _id: 1, host: "mongodb-rs0-1:27017" }
    ]
 })