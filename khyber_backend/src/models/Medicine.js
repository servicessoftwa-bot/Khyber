const mongoose = require('mongoose');
const medicineSchema = new mongoose.Schema({
  name:                { type: String, required: true },
  category:            { type: String },
  description:         { type: String },
  price:               { type: Number },
  unit:                { type: String, default: 'pack' },
  manufacturer:        { type: String },
  requiresPrescription:{ type: Boolean, default: false },
  inStock:             { type: Boolean, default: true },
  pharmacyName:        { type: String },
  district:            { type: String },
}, { timestamps: true });
module.exports = mongoose.model('Medicine', medicineSchema);
