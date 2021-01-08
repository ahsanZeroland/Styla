const { authJwt } = require("../middleware");
const usercontroller = require("../controllers/user.controller");

var bodyParser = require('body-parser')

module.exports = function(app) {
  app.use(bodyParser.json())
  app.use(function(req, res, next) {
    res.header(
      "Access-Control-Allow-Headers",
      "x-access-token, Origin, Content-Type, Accept"
    );
    next();
  });

  app.get("/api/styla/all", usercontroller.allAccess);

  app.get("/api/styla/user", [authJwt.verifyToken], usercontroller.userBoard);

  app.get(
    "/api/styla/vender",
    [authJwt.verifyToken, authJwt.isVender],
    usercontroller.venderBoard
  );

  app.get(
    "/api/styla/admin",
    [authJwt.verifyToken, authJwt.isAdmin],
    usercontroller.getUsers
  );
  app.get("/styla/userlist", usercontroller.getUsers);
};