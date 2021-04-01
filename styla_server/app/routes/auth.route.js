const { verifySignUp } = require("../middleware");
var bodyParser = require('body-parser')
const controller = require("../controllers/auth.controller");
var upload = require('../middleware/upload')
const verify = require('../routes/verifytoken.route');
const { user } = require("../models");
/////
//format for fields [{ name: 'nic', maxCount: 1 }]
var cpUpload = upload.fields([{ name: 'profileimage', maxCount: 1 }]);
////
module.exports = function(app) {
  
  app.use(bodyParser.json())
  app.use(function(req, res, next) {
    res.header(
      "Access-Control-Allow-Headers",
      "x-access-token, Origin, Content-Type, Accept"
    );
    next();
  });

  app.post(
    "/styla/auth/signup",
    cpUpload,
    [
      verifySignUp.checkDuplicateEmail,
      verifySignUp.checkRolesExisted
    ],
    controller.signup
  );
  app.get(
    "/styla/auth/finduser",
    verify,
    controller.findUser
  );
  app.get(
    "/styla/auth/allusers",
    verify,
    controller.AllUsers
  );
  

  app.post("/styla/auth/signin", controller.signin);
};