const db = require('../models/index');

const getUser = async (req, res) => {
    try {
        console.log(`Fetching profile for user ID: ${req.id}`);
        const user = await db.Users.findByPk(req.id, {
            attributes: ['id', 'username', 'email', 'image'],
        });

        if (!user) {
            console.log('User not found');
            return res.status(404).json({ error: 'User not found' });
        }

        res.json(user);
    } catch (err) {
        console.error('Failed to fetch profile', err);
        res.status(500).json({ error: 'Failed to fetch profile' });
    }
};

const uploadImage = async (req, res) => {
    try {
        const user = await db.Users.findByPk(req.id);
        if (!user) {
            return res.status(404).json({ error: "User not found" });
        }

        user.image = req.file.filename;
        await user.save();
        res.json(user);
    } catch (err) {
        console.error('Failed to upload image:', err);
        res.status(500).json({ error: "Failed to upload image" });
    }
};

module.exports = {getUser, uploadImage}