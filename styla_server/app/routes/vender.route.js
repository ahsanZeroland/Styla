
const venderController = require("../controllers/vender.controller");
var bodyParser = require('body-parser');

//const verifytoken = require("../routes/verifytoken.route");

module.exports = function(app) {
    app.use(bodyParser.json()),
    
    app.post(
        "/styla/vender/save",
        venderController.saveVender,
      );

}