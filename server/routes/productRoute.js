const express = require('express');
const router = express.Router();
const { getProduct, createProduct, updateProduct, deleteProduct, getProductById } = require('../controllers/productController');
const authMiddleware = require('../middleware/authenticationMiddleware');

router.get('/', authMiddleware, getProduct);
router.get('/:id', authMiddleware, getProductById);
router.post('/', authMiddleware, createProduct);
router.put('/:id', authMiddleware, updateProduct);
router.delete('/:id', authMiddleware, deleteProduct);

module.exports = router;
