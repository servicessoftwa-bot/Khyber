const mongoose = require('mongoose');

const jobSchema = new mongoose.Schema({
  title:       { type: String, required: true },
  company:     { type: String, required: true },
  description: { type: String },
  category:    { type: String },
  type:        { type: String, enum: ['full-time','part-time','contract','internship'], default: 'full-time' },
  location:    { type: String },
  district:    { type: String },
  salary:      { min: Number, max: Number, currency: { type: String, default: 'PKR' } },
  skills:      [String],
  deadline:    { type: Date },
  isActive:    { type: Boolean, default: true },
  postedBy:    { type: mongoose.Schema.Types.ObjectId, ref: 'User' },
}, { timestamps: true });

module.exports = mongoose.model('Job', jobSchema);
