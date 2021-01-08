const categorycontroller = require("../controllers/category.controller");
var bodyParser = require('body-parser');

const verifytoken = require("../routes/verifytoken.route");

module.exports = function(app) {
    app.use(bodyParser.json()),
    
    app.post(
        "/styla/category/save",verifytoken,
        categorycontroller.savecategory
      );
}