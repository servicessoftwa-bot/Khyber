const mongoose = require('mongoose');
const hospitalSchema = new mongoose.Schema({
  name:        { type: String, required: true },
  type:        { type: String, enum: ['public','private','clinic','specialist'], default: 'public' },
  description: { type: String },
  location:    { type: String },
  district:    { type: String },
  phone:       { type: String },
  emergency:   { type: Boolean, default: false },
  specialties: [String],
  rating:      { type: Number, default: 0 },
  beds:        { type: Number },
  images:      [String],
  isActive:    { type: Boolean, default: true },
}, { timestamps: true });
module.exports = mongoose.model('Hospital', hospitalSchema);
