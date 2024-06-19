'use strict';
const {
    Model
} = require('sequelize');
module.exports = (sequelize, DataTypes) => {
    class Categories extends Model {
        static associate(models) {
            Categories.hasMany(models.Products, {
                foreignKey: 'categoryId',
            })
        }
    }
    Categories.init({
        name: {
            type: DataTypes.STRING,
            allowNull: false,
            unique: true
        },
    },

        {
            sequelize,
            modelName: 'Categories'
        });
    return Categories;
};
