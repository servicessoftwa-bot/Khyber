const mongoose = require('mongoose');
const emergencyServiceSchema = new mongoose.Schema({
  name:        { type: String, required: true },
  type:        { type: String, enum: ['police','fire','ambulance','rescue','disaster','other'], default: 'other' },
  contact:     { type: String, required: true },
  altContact:  { type: String },
  district:    { type: String },
  available24h:{ type: Boolean, default: true },
  description: { type: String },
  location:    { type: String },
  isActive:    { type: Boolean, default: true },
}, { timestamps: true });
module.exports = mongoose.model('EmergencyService', emergencyServiceSchema);
