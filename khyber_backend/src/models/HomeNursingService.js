const mongoose = require('mongoose');
const homeNursingServiceSchema = new mongoose.Schema({
  name:        { type: String, required: true },
  serviceType: { type: String, enum: ['nursing','physiotherapy','lab','doctor_visit','elder_care','palliative','other'], default: 'nursing' },
  description: { type: String },
  price:       { type: Number },
  priceUnit:   { type: String, enum: ['per_visit','per_day','per_month'], default: 'per_visit' },
  rating:      { type: Number, default: 0 },
  phone:       { type: String },
  district:    { type: String },
  available24h:{ type: Boolean, default: false },
  isActive:    { type: Boolean, default: true },
}, { timestamps: true });
module.exports = mongoose.model('HomeNursingService', homeNursingServiceSchema);
