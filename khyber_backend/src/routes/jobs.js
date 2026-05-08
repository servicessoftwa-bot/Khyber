const router = require('express').Router();
const Job = require('../models/Job');
router.get('/', async (req, res) => {
  try {
    const { category, type, district, search } = req.query;
    const filter = { isActive: true };
    if (category) filter.category = category;
    if (type) filter.type = type;
    if (district) filter.district = district;
    if (search) filter.title = { $regex: search, $options: 'i' };
    const data = await Job.find(filter).sort({ createdAt: -1 });
    res.json({ success: true, data });
  } catch (err) { res.status(500).json({ success: false, message: err.message }); }
});
router.get('/:id', async (req, res) => {
  try {
    const data = await Job.findById(req.params.id);
    if (!data) return res.status(404).json({ success: false, message: 'Not found' });
    res.json({ success: true, data });
  } catch (err) { res.status(500).json({ success: false, message: err.message }); }
});
module.exports = router;
