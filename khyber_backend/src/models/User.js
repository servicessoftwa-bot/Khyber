const mongoose = require('mongoose');
const bcrypt = require('bcryptjs');

const userSchema = new mongoose.Schema({
  name:     { type: String, required: true },
  phone:    { type: String, required: true, unique: true },
  email:    { type: String, unique: true, sparse: true },
  password: { type: String, required: true },
  city:     { type: String, default: 'Peshawar' },
  district: { type: String, default: 'Peshawar' },
  avatar:   { type: String },
  role:     { type: String, enum: ['user', 'admin', 'vendor'], default: 'user' },
  isActive: { type: Boolean, default: true },
}, { timestamps: true });

userSchema.pre('save', async function(next) {
  if (!this.isModified('password')) return next();
  this.password = await bcrypt.hash(this.password, 10);
  next();
});

userSchema.methods.matchPassword = function(plain) {
  return bcrypt.compare(plain, this.password);
};

module.exports = mongoose.model('User', userSchema);
