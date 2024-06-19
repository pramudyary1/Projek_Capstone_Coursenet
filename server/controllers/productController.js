const db = require('../models/index')
const { Op } = require('sequelize')

const getProduct = async (req, res) => {
    try {
        const products = await db.Products.findAll();
        res.json(products);
    } catch (error) {
        res.status(500).json({ error: 'Error get all products' });
    }
};

const getProductById = async (req, res) => {
    try {
        const id = req.params.id
        const product = await db.Products.findByPk(id)
        if (!product) {
            return res.status(404).json({ error: 'Product not found' });
        }
        res.json(product);
    } catch (error) {
        console.error('Error fetching product:', error);
        res.status(500).json({ error: 'Error fetching product' });
    }
}

const createProduct = async (req, res) => {
    try {
        const { name, price, qty, categoryId, url } = req.body;
        const product = await db.Products.create({
            name,
            price,
            qty,
            categoryId,
            url,
            createdBy: req.user.username,
            updatedBy: req.user.username,
        });
        res.status(201).json(product);
    } catch (error) {
        res.status(500).json({ error: 'Error creating product' });
    }
};

const updateProduct = async (req, res) => {
    try {
        const { name, price, qty, categoryId, url } = req.body;
        const product = await db.Products.findByPk(req.params.id);
        if (!product) {
            return res.status(404).json({ error: 'Product not found' });
        }
        product.name = name;
        product.price = price;
        product.qty = qty;
        product.categoryId = categoryId;
        product.url = url;
        product.updatedBy = req.user.username;
        await product.save();
        res.json(product);
    } catch (error) {
        res.status(500).json({ error: 'Error updating product' });
    }
};

const deleteProduct = async (req, res) => {
    try {
        const product = await db.Products.findByPk(req.params.id);
        if (!product) {
            return res.status(404).json({ error: 'Product not found' });
        }
        await product.destroy();
        res.json({message: "Product has been deleted"})
        res.status(204).end();
    } catch (error) {
        res.status(500).json({ error: 'Error deleting product' });
    }
};

module.exports = { getProduct, getProductById, createProduct, updateProduct, deleteProduct }