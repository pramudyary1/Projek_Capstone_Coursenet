const express = require('express');
const router = express.Router();
const upload = require('../middleware/imageMiddleware');
const { uploadImage, getUser } = require('../controllers/userController');
const authenticationMiddleware = require('../middleware/authenticationMiddleware');

router.get('/profile', authenticationMiddleware, getUser)
router.patch('/upload', authenticationMiddleware, upload.single('file'), uploadImage);

module.exports = router;