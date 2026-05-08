const router = require('express').Router();
const Event = require('../models/Event');
router.get('/', async (req, res) => {
  try {
    const { category, district } = req.query;
    const filter = { isActive: true };
    if (category) filter.category = category;
    if (district) filter.district = district;
    const data = await Event.find(filter).sort({ startDate: 1 });
    res.json({ success: true, data });
  } catch (err) { res.status(500).json({ success: false, message: err.message }); }
});
router.get('/:id', async (req, res) => {
  try {
    const data = await Event.findById(req.params.id);
    if (!data) return res.status(404).json({ success: false, message: 'Not found' });
    res.json({ success: true, data });
  } catch (err) { res.status(500).json({ success: false, message: err.message }); }
});
module.exports = router;
