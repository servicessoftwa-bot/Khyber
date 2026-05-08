const router = require('express').Router();

router.get('/', async (req, res) => {
  try {
    res.json({ success: true, data: [], message: 'hospitals endpoint ready' });
  } catch (err) { res.status(500).json({ success: false, message: err.message }); }
});

module.exports = router;
