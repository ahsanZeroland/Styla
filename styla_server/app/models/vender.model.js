const mongoose = require('mongoose');

const Schema = mongoose.Schema;

const venderSchema = new Schema({
    owner: { type: mongoose.Schema.Types.ObjectId, ref: 'User', required: true},
    name: String,
    location: String,
    description: String,
    imageurl: String,
    created_at: { type: Date },
    updated_at: { type: Date, default: Date.now },
    updated: {type: Date, default: Date.now}
});


module.exports = mongoose.model('Vender', venderSchema);

