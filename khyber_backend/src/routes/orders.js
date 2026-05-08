const router = require('express').Router();
const auth = require('../middleware/auth');
const Order = require('../models/Order');
router.get('/', auth, async (req, res) => {
  try {
    const data = await Order.find({ user: req.user.id }).sort({ createdAt: -1 });
    res.json({ success: true, data });
  } catch (err) { res.status(500).json({ success: false, message: err.message }); }
});
router.post('/', auth, async (req, res) => {
  try {
    const order = await Order.create({ ...req.body, user: req.user.id });
    res.status(201).json({ success: true, data: order });
  } catch (err) { res.status(500).json({ success: false, message: err.message }); }
});
router.patch('/:id/cancel', auth, async (req, res) => {
  try {
    const order = await Order.findOneAndUpdate(
      { _id: req.params.id, user: req.user.id },
      { status: 'cancelled' }, { new: true }
    );
    res.json({ success: true, data: order });
  } catch (err) { res.status(500).json({ success: false, message: err.message }); }
});
module.exports = router;
