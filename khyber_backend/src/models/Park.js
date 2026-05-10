const mongoose = require('mongoose');
const parkSchema = new mongoose.Schema({
  name:        { type: String, required: true },
  description: { type: String },
  location:    { type: String },
  district:    { type: String },
  images:      [String],
  facilities:  [String],
  rating:      { type: Number, default: 0 },
  entryFee:    { type: Number, default: 0 },
  openingHours:{ type: String },
  isOpen:      { type: Boolean, default: true },
  isActive:    { type: Boolean, default: true },
}, { timestamps: true });
module.exports = mongoose.model('Park', parkSchema);
