const db = require('../models/index')

const getAllCategories = async (req, res) => {
    try {
        const getCategories = await db.Categories.findAll()
        res.json(getCategories)
    } catch (error) {
        console.log(error)
    }
}

const addCategories = async (req, res) => {
    const { name, image } = req.body
    const categories = await db.Categories.create({ name, image })
    res.status(201).json(categories)
}

module.exports = { getAllCategories, addCategories }
