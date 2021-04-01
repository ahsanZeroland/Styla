const mongoose = require("mongoose");

var RatingProduct = mongoose.model(
    "RatingProduct",new mongoose.Schema(
    {
    user:{ type: mongoose.Schema.Types.ObjectId, ref: 'User'},
    rating:{type:Number},
    product:{type:mongoose.Schema.Types.ObjectId, ref:'Product'},
    review:{type:String},
    created_at:{ type: Date },
}), { versionKey: false },{strict: false});

module.exports = RatingProduct; 
