const mongoose = require('mongoose');

const Schema = mongoose.Schema;

const userSchema = new Schema({
  name: {type: String,required: true},
  email: {
      type: String,
      required: true,
  },
  phone: {type: String,required: true},
  password: {type: String,required: true},
  country: { type: String, required: true},
  roles: [
    {
      type: mongoose.Schema.Types.ObjectId,
      ref: "Role"
    }
  ],
  joinDate:{
      type: Date,
      required: true,
      default: Date.now,
  },
  profileImage: {
    type: Buffer,
    // required: true
  },
  profileImageType: {
    type: String,
    // required: true
  },
});

userSchema.virtual('profileImagePath').get(function() {
  if (this.profileImage != null && this.profileImageType != null) {
    return `data:${this.profileImageType};charset=utf-8;base64,${this.profileImage.toString('base64')}`
  }
})

module.exports = mongoose.model('User', userSchema);

