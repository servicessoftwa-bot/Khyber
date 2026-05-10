const mongoose = require('mongoose');
const transportRouteSchema = new mongoose.Schema({
  from:        { type: String, required: true },
  to:          { type: String, required: true },
  operator:    { type: String },
  price:       { type: Number },
  duration:    { type: String },
  vehicleType: { type: String, enum: ['bus','van','taxi','rickshaw','coaster'], default: 'bus' },
  departures:  [String],
  district:    { type: String },
  phone:       { type: String },
  isActive:    { type: Boolean, default: true },
}, { timestamps: true });
module.exports = mongoose.model('TransportRoute', transportRouteSchema);
