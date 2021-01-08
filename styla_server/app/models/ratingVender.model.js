const mongoose = require("mongoose");

var RatingVender = mongoose.model(
    "RatingVender",new mongoose.Schema(
    {
    user:{ type: mongoose.Schema.Types.ObjectId, ref: 'User'},
    rating:{type:Number},
    vender:{type:mongoose.Schema.Types.ObjectId, ref:'Vender'},
    review:{type:String},
    created_at:{ type: Date },
}), { versionKey: false },{strict: false});

module.exports = RatingVender;
