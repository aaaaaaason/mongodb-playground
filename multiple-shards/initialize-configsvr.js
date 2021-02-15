rs.initiate(
    {
      _id: "cfg",
      configsvr: true,
      members: [
        { _id : 0, host : "mongodb-cfg-0:27019" }
      ]
    }
  )