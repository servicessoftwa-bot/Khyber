const mongoose = require('mongoose');
const amusementPlaceSchema = new mongoose.Schema({
  name:        { type: String, required: true },
  category:    { type: String, enum: ['park','cinema','sports','games','other'], default: 'other' },
  description: { type: String },
  location:    { type: String },
  district:    { type: String },
  images:      [String],
  rating:      { type: Number, default: 0 },
  priceRange:  { type: String },
  openingHours:{ type: String },
  isOpen:      { type: Boolean, default: true },
  phone:       { type: String },
  isActive:    { type: Boolean, default: true },
}, { timestamps: true });
module.exports = mongoose.model('AmusementPlace', amusementPlaceSchema);
