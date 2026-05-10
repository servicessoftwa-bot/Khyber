const mongoose = require('mongoose');
const realEstateListingSchema = new mongoose.Schema({
  title:     { type: String, required: true },
  type:      { type: String, enum: ['apartment','house','plot','commercial','farmhouse'], default: 'house' },
  purpose:   { type: String, enum: ['rent','sale'], default: 'sale' },
  price:     { type: Number },
  area:      { type: Number },
  areaUnit:  { type: String, enum: ['sqft','marla','kanal'], default: 'marla' },
  bedrooms:  { type: Number },
  bathrooms: { type: Number },
  location:  { type: String },
  district:  { type: String },
  images:    [String],
  contact:   { type: String },
  features:  [String],
  isActive:  { type: Boolean, default: true },
}, { timestamps: true });
module.exports = mongoose.model('RealEstateListing', realEstateListingSchema);
