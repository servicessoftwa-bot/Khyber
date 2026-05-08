const mongoose = require('mongoose');

const hotelSchema = new mongoose.Schema({
  name:          { type: String, required: true },
  type:          { type: String, enum: ['hotel','resort','villa','guesthouse'], default: 'hotel' },
  description:   { type: String },
  location:      { type: String },
  district:      { type: String },
  images:        [String],
  rating:        { type: Number, default: 0 },
  reviews:       { type: Number, default: 0 },
  pricePerNight: { type: Number },
  amenities:     [String],
  rooms:         { type: Number },
  isAvailable:   { type: Boolean, default: true },
  phone:         { type: String },
  email:         { type: String },
}, { timestamps: true });

module.exports = mongoose.model('Hotel', hotelSchema);
