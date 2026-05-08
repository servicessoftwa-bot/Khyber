const mongoose = require('mongoose');

const eventSchema = new mongoose.Schema({
  title:       { type: String, required: true },
  description: { type: String },
  category:    { type: String },
  venue:       { type: String },
  city:        { type: String, default: 'Peshawar' },
  district:    { type: String },
  startDate:   { type: Date, required: true },
  endDate:     { type: Date },
  image:       { type: String },
  price:       { type: Number, default: 0 },
  isFree:      { type: Boolean, default: true },
  organizer:   { type: String },
  isActive:    { type: Boolean, default: true },
}, { timestamps: true });

module.exports = mongoose.model('Event', eventSchema);
