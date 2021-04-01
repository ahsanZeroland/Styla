const config = require("../config/auth.config");
const db = require("../models");
const User = db.user;
const Role = db.role;

var jwt = require("jsonwebtoken");
var bcrypt = require("bcryptjs");

exports.signup = async (req, res) => {
  const salt = await bcrypt.genSalt(10)
  const hashPassword = await bcrypt.hash(req.body.password,salt);
  const user = new User({
    name: req.body.name,
    email: req.body.email,
    phone: req.body.phone,
    password: hashPassword,
    country: req.body.country
  });

  user.save((err, user) => {
    if (err) {
      res.status(500).send({ message: err });
      return;
    }

    if (req.body.roles) {
      Role.find(
        {
          name: { $in: req.body.roles }
        },
        (err, roles) => {
          if (err) {
            res.status(500).send({ message: err });
            return;
          }

          user.roles = roles.map(role => role._id);
          user.save(err => {
            if (err) {
              res.status(500).send({ message: err });
              return;
            }

            res.send({ message: "User was registered successfully!" });
          });
        }
      );
    } else {
      Role.findOne({ name: "user" }, (err, role) => {
        if (err) {
          res.status(500).send({ message: err });
          return;
        }

        user.roles = [role._id];
        user.save(err => {
          if (err) {
            res.status(500).send({ message: err });
            return;
          }

          res.send({ message: "User was registered successfully!" });
        });
      });
    }
  });
};
exports.findUser = async(req,res)=>{
  console.log(req.user)
  try{
    const singleUser = await User.findById(req.user.id).select('name email phone imageurl');
    console.log(singleUser);
    res.status(200).json(singleUser);
  }
  catch (err){
    res.status(500).json({message: err.message});
  }

}
exports.AllUsers = async(req,res)=>{

  try {
    const users = await User.find().select('name email phone imageurl -_id').populate('roles','name')
    console.log(users);
    res.json(users);
  } catch (err) {
    res.status(500).json({ message: err.message });
  }
}
exports.signin = (req, res) => {
  User.findOne({
    email: req.body.email
  })
    .populate("roles", "-__v")
    .exec((err, user) => {
      if (err) {
        res.status(500).send({ message: err });
        return;
      }

      if (!user) {
        return res.status(404).send({ message: "User Not found." });
      }

      var passwordIsValid = bcrypt.compareSync(
        req.body.password,
        user.password
      );

      if (!passwordIsValid) {
        return res.status(401).send({
          accessToken: null,
          message: "Invalid Password!"
        });
      }
      var authorities = [];

      for (let i = 0; i < user.roles.length; i++) {
        authorities.push("ROLE_" + user.roles[i].name.toUpperCase());
        console.log(authorities);
        console.log(user.roles[i].name);
        // console.log(user.roles[i+1].name.toUpperCase);

      }
      var token = jwt.sign({ id: user.id,roles:authorities }, config.secret, {
        expiresIn: 604800 // one week
      });
      res.status(200).send({
        accessToken: token
      });
    });
};
