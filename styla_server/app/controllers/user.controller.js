exports.allAccess = (req, res) => {
    res.status(200).send("Public Content.");
  };
  
  exports.userBoard = (req, res) => {
    res.status(200).send("User Content.");
  };
  
  exports.adminBoard = (req, res) => {
    res.status(200).send("Admin Content.");
  };
  
  exports.venderBoard = (req, res) => {
    res.status(200).send("Vender Content.");
  };
  exports.getUsers = async (req, res) =>{
    console.log('calling')
    try {
      const users = await User.find().select('name email phone -_id')
      console.log(users);
      res.json(users);
    } catch (err) {
      res.status(500).json({ message: err.message });
    }
  }