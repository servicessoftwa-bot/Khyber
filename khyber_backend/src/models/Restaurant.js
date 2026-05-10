const mongoose = require('mongoose');
const restaurantSchema = new mongoose.Schema({
  name:              { type: String, required: true },
  cuisine:           { type: String },
  description:       { type: String },
  location:          { type: String },
  district:          { type: String },
  images:            [String],
  rating:            { type: Number, default: 0 },
  reviews:           { type: Number, default: 0 },
  priceRange:        { type: String, enum: ['cheap','moderate','expensive'], default: 'moderate' },
  isOpen:            { type: Boolean, default: true },
  phone:             { type: String },
  deliveryAvailable: { type: Boolean, default: false },
  featured:          { type: Boolean, default: false },
}, { timestamps: true });
module.exports = mongoose.model('Restaurant', restaurantSchema);
