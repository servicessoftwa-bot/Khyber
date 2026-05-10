const mongoose = require('mongoose');
const educationInstitutionSchema = new mongoose.Schema({
  name:        { type: String, required: true },
  type:        { type: String, enum: ['school','college','university','academy','madrassa','other'], default: 'school' },
  description: { type: String },
  location:    { type: String },
  district:    { type: String },
  contact:     { type: String },
  rating:      { type: Number, default: 0 },
  established: { type: Number },
  affiliation: { type: String },
  programs:    [String],
  isActive:    { type: Boolean, default: true },
}, { timestamps: true });
module.exports = mongoose.model('EducationInstitution', educationInstitutionSchema);
