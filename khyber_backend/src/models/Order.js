const mongoose = require('mongoose');

const orderSchema = new mongoose.Schema({
  user:     { type: mongoose.Schema.Types.ObjectId, ref: 'User', required: true },
  module:   { type: String, required: true },
  items:    [{ name: String, qty: Number, price: Number }],
  total:    { type: Number, required: true },
  address:  { type: String },
  status:   { type: String, enum: ['pending','confirmed','preparing','on_way','delivered','cancelled'], default: 'pending' },
  paymentMethod: { type: String, default: 'cash' },
  notes:    { type: String },
}, { timestamps: true });

module.exports = mongoose.model('Order', orderSchema);
