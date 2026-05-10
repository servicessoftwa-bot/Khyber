const mongoose = require('mongoose');
const shoppingProductSchema = new mongoose.Schema({
  name:          { type: String, required: true },
  category:      { type: String },
  description:   { type: String },
  price:         { type: Number, required: true },
  originalPrice: { type: Number },
  image:         { type: String },
  shopName:      { type: String },
  district:      { type: String },
  inStock:       { type: Boolean, default: true },
  brand:         { type: String },
  featured:      { type: Boolean, default: false },
}, { timestamps: true });
module.exports = mongoose.model('ShoppingProduct', shoppingProductSchema);
