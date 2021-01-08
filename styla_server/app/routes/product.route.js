const productcontroller = require("../controllers/product.controller");
var bodyParser = require('body-parser');

const verifytoken = require("../routes/verifytoken.route");

module.exports = function(app) {
    app.use(bodyParser.json()),
    
    app.post(
        "/styla/product/save",verifytoken,
        productcontroller.saveproduct
      );
    app.get("/styla/product/list",verifytoken,productcontroller.getproducts)
    app.get("/styla/product/listname",verifytoken,productcontroller.getproductName)

}