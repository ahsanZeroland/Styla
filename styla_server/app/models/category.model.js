const mongoose = require('mongoose');

const Schema = mongoose.Schema;

const categorySchema = new Schema({
    title:{
        type: String,
        trim: true,
        required: true,
        unique: true,
    },
    imageurl:{type: String},
    subcategorys:[{ 
        title:{
            type: String,
            trim: true,
            required: true,
            unique: true,
        },
        imageurl:{type: String},
    }],
});
module.exports = mongoose.model('Category', categorySchema);