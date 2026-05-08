const mongoose = require('mongoose');

const businessSchema = new mongoose.Schema({
  name:        { type: String, required: true },
  category:    { type: String, required: true },
  description: { type: String },
  address:     { type: String },
  city:        { type: String, default: 'Peshawar' },
  district:    { type: String },
  phone:       { type: String },
  images:      [String],
  rating:      { type: Number, default: 0 },
  reviews:     { type: Number, default: 0 },
  isVerified:  { type: Boolean, default: false },
  isActive:    { type: Boolean, default: true },
  location:    { lat: Number, lng: Number },
  owner:       { type: mongoose.Schema.Types.ObjectId, ref: 'User' },
}, { timestamps: true });

module.exports = mongoose.model('Business', businessSchema);
