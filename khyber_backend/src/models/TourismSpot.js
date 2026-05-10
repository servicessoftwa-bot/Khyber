const mongoose = require('mongoose');
const tourismSpotSchema = new mongoose.Schema({
  name:        { type: String, required: true },
  category:    { type: String, enum: ['historical','natural','religious','cultural','adventure'], default: 'natural' },
  description: { type: String },
  location:    { type: String },
  district:    { type: String },
  images:      [String],
  rating:      { type: Number, default: 0 },
  reviews:     { type: Number, default: 0 },
  entryFee:    { type: Number, default: 0 },
  openingHours:{ type: String },
  bestSeason:  { type: String },
  isActive:    { type: Boolean, default: true },
}, { timestamps: true });
module.exports = mongoose.model('TourismSpot', tourismSpotSchema);
