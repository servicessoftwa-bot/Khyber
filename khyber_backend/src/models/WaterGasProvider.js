const mongoose = require('mongoose');
const waterGasProviderSchema = new mongoose.Schema({
  name:        { type: String, required: true },
  type:        { type: String, enum: ['water','gas','electricity','both'], default: 'water' },
  description: { type: String },
  coverage:    [String],
  contact:     { type: String },
  pricing:     { type: String },
  district:    { type: String },
  isActive:    { type: Boolean, default: true },
}, { timestamps: true });
module.exports = mongoose.model('WaterGasProvider', waterGasProviderSchema);
