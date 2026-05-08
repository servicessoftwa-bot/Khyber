const router = require('express').Router();
const Hotel = require('../models/Hotel');
router.get('/', async (req, res) => {
  try {
    const { type, district } = req.query;
    const filter = { isAvailable: true };
    if (type) filter.type = type;
    if (district) filter.district = district;
    const data = await Hotel.find(filter).sort({ rating: -1 });
    res.json({ success: true, data });
  } catch (err) { res.status(500).json({ success: false, message: err.message }); }
});
router.get('/:id', async (req, res) => {
  try {
    const data = await Hotel.findById(req.params.id);
    if (!data) return res.status(404).json({ success: false, message: 'Not found' });
    res.json({ success: true, data });
  } catch (err) { res.status(500).json({ success: false, message: err.message }); }
});
module.exports = router;
