const mongoose = require('mongoose');
const newsArticleSchema = new mongoose.Schema({
  title:       { type: String, required: true },
  category:    { type: String, enum: ['local','national','sports','business','health','education','other'], default: 'local' },
  source:      { type: String },
  publishedAt: { type: Date, default: Date.now },
  summary:     { type: String },
  content:     { type: String },
  image:       { type: String },
  url:         { type: String },
  isActive:    { type: Boolean, default: true },
}, { timestamps: true });
module.exports = mongoose.model('NewsArticle', newsArticleSchema);
