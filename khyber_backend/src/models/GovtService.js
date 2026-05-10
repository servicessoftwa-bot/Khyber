const mongoose = require('mongoose');
const govtServiceSchema = new mongoose.Schema({
  name:         { type: String, required: true },
  department:   { type: String },
  description:  { type: String },
  location:     { type: String },
  district:     { type: String },
  phone:        { type: String },
  documents:    [String],
  workingHours: { type: String },
  category:     { type: String },
  isActive:     { type: Boolean, default: true },
}, { timestamps: true });
module.exports = mongoose.model('GovtService', govtServiceSchema);
