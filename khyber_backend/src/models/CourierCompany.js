const mongoose = require('mongoose');
const courierCompanySchema = new mongoose.Schema({
  name:         { type: String, required: true },
  description:  { type: String },
  services:     [String],
  pricePerKg:   { type: Number },
  deliveryTime: { type: String },
  phone:        { type: String },
  rating:       { type: Number, default: 0 },
  coverage:     [String],
  logo:         { type: String },
  isActive:     { type: Boolean, default: true },
}, { timestamps: true });
module.exports = mongoose.model('CourierCompany', courierCompanySchema);
