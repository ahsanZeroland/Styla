const mongoose = require('mongoose');

const Schema = mongoose.Schema;

const productSchema = new Schema({
    title:{type: String, required: true},
    category:{ type: mongoose.Schema.Types.ObjectId, ref: 'Category', required: true},
    productCode: {type: String, required: true},
    colors:[{
        color:{type: String,required: true},
        image:{type: String,required: true},
    }],
    sizes:[{
        size:{type: Number,required: true},
        price:{type: Number,required: true},
    }],
    quantity: {type: Number, required: true},
    description: {type: String, required: true},
    vender: {type: Schema.Types.ObjectId, ref: 'Vender', required: true},
    created_at:{ type: Date },
    updated_at:{ type: Date, default: Date.now },
    updated:{type: Date, default: Date.now}
});


module.exports = mongoose.model('Product', productSchema);
