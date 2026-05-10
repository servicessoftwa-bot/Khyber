const mongoose = require('mongoose');
const groceryProductSchema = new mongoose.Schema({
  name:      { type: String, required: true },
  category:  { type: String },
  description:{ type: String },
  price:     { type: Number, required: true },
  unit:      { type: String, default: 'piece' },
  image:     { type: String },
  storeName: { type: String },
  district:  { type: String },
  inStock:   { type: Boolean, default: true },
  brand:     { type: String },
  featured:  { type: Boolean, default: false },
}, { timestamps: true });
module.exports = mongoose.model('GroceryProduct', groceryProductSchema);
