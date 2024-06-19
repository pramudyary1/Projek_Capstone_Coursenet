const express = require('express');
const router = express.Router();
const { getAllCategories, addCategories } = require('../controllers/categoryController');
const authenticationMiddleware = require('../middleware/authenticationMiddleware');

router.get('/', authenticationMiddleware,getAllCategories);
router.post('/', authenticationMiddleware,addCategories)

module.exports = router;
