const mongoose = require('mongoose');

const Schema = mongoose.Schema;

const sliderSchema = new Schema({
    title:{type: String, required: true},
    sliderImage: {
        type: Buffer,
        required: true
      },
      sliderImageType: {
        type: String,
        required: true
      },
    vender: {type: Schema.Types.ObjectId, ref: 'Vender', required: true},
    created_at:{ type: Date },
    expiration:{ type: Date },
    updated_at:{ type: Date, default: Date.now },
    updated:{type: Date, default: Date.now}
});
sliderSchema.virtual('sliderImagePath').get(function() {
    if (this.sliderImage != null && this.sliderImageType != null) {
      return `data:${this.sliderImageType};charset=utf-8;base64,${this.sliderImage.toString('base64')}`
    }
  })

module.exports = mongoose.model('Slider', sliderSchema);
