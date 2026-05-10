const mongoose = require('mongoose');
const craftSchema = new mongoose.Schema({
  name:        { type: String, required: true },
  artisan:     { type: String },
  category:    { type: String, enum: ['pottery','weaving','embroidery','woodwork','jewelry','calligraphy','other'], default: 'other' },
  description: { type: String },
  price:       { type: Number },
  image:       { type: String },
  district:    { type: String },
  rating:      { type: Number, default: 0 },
  inStock:     { type: Boolean, default: true },
  featured:    { type: Boolean, default: false },
}, { timestamps: true });
module.exports = mongoose.model('Craft', craftSchema);
