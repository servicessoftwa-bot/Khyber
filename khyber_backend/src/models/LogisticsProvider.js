const mongoose = require('mongoose');
const logisticsProviderSchema = new mongoose.Schema({
  name:        { type: String, required: true },
  description: { type: String },
  services:    [String],
  coverage:    [String],
  phone:       { type: String },
  rating:      { type: Number, default: 0 },
  priceRange:  { type: String },
  logo:        { type: String },
  isActive:    { type: Boolean, default: true },
}, { timestamps: true });
module.exports = mongoose.model('LogisticsProvider', logisticsProviderSchema);
