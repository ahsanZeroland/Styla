const mongoose = require('mongoose');
mongoose.Promise = global.Promise;

const db = {};

db.mongoose = mongoose;

db.user = require("./user.model");
db.role = require("./role.model");
db.product = require("./product.model");
db.category = require("./category.model");
db.vender = require("./vender.model");
db.slider = require("./slider.model");

db.ROLES = ["user", "admin", "vender"];

module.exports = db;