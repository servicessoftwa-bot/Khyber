const router = require('express').Router();
const Business = require('../models/Business');
router.get('/', async (req, res) => {
  try {
    const { category, district, search } = req.query;
    const filter = { isActive: true };
    if (category) filter.category = category;
    if (district) filter.district = district;
    if (search) filter.name = { $regex: search, $options: 'i' };
    const data = await Business.find(filter).sort({ rating: -1 });
    res.json({ success: true, data });
  } catch (err) { res.status(500).json({ success: false, message: err.message }); }
});
router.get('/:id', async (req, res) => {
  try {
    const data = await Business.findById(req.params.id);
    if (!data) return res.status(404).json({ success: false, message: 'Not found' });
    res.json({ success: true, data });
  } catch (err) { res.status(500).json({ success: false, message: err.message }); }
});
module.exports = router;
