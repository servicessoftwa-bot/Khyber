const router = require('express').Router();
const Restaurant = require('../models/Restaurant');

router.get('/', async (req, res) => {
  try {
    const { cuisine, district, search, priceRange } = req.query;
    const filter = { isOpen: true };
    if (cuisine) filter.cuisine = cuisine;
    if (district) filter.district = district;
    if (priceRange) filter.priceRange = priceRange;
    if (search) filter.name = { $regex: search, $options: 'i' };
    const data = await Restaurant.find(filter).sort({ rating: -1 });
    res.json({ success: true, data });
  } catch (err) { res.status(500).json({ success: false, message: err.message }); }
});

router.get('/:id', async (req, res) => {
  try {
    const data = await Restaurant.findById(req.params.id);
    if (!data) return res.status(404).json({ success: false, message: 'Not found' });
    res.json({ success: true, data });
  } catch (err) { res.status(500).json({ success: false, message: err.message }); }
});

router.post('/', async (req, res) => {
  try {
    const data = new Restaurant(req.body);
    await data.save();
    res.status(201).json({ success: true, data });
  } catch (err) { res.status(400).json({ success: false, message: err.message }); }
});

router.put('/:id', async (req, res) => {
  try {
    const data = await Restaurant.findByIdAndUpdate(req.params.id, req.body, { new: true, runValidators: true });
    if (!data) return res.status(404).json({ success: false, message: 'Not found' });
    res.json({ success: true, data });
  } catch (err) { res.status(400).json({ success: false, message: err.message }); }
});

router.delete('/:id', async (req, res) => {
  try {
    const data = await Restaurant.findByIdAndDelete(req.params.id);
    if (!data) return res.status(404).json({ success: false, message: 'Not found' });
    res.json({ success: true, message: 'Deleted' });
  } catch (err) { res.status(500).json({ success: false, message: err.message }); }
});

module.exports = router;
