const mongoose = require("mongoose");

var Order = mongoose.model(

    "Order",new mongoose.Schema({
        orderNumber: String,
        name: String,
        user: {type: mongoose.Schema.Types.ObjectId, ref: 'User'},
        items:[{
            item: {type: mongoose.Schema.Types.ObjectId, ref: 'Product'},
        }],
        payment:{ type: mongoose.Schema.Types.ObjectId, ref: 'Payment'},
        subTotal: String,
        tax: String,
        priceTotal: String,
        created_at: {type: Date, default: Date.now },
        
    }), { versionKey: false },{strict: false}
);

module.exports = Order;
