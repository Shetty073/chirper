const router = require('express').Router()
const User = require('../models/user')
const Chirp = require('../models/chirp')
const { verifyAuthToken } = require('../verifytoken')


// Chirp endpoints
router.post('/create', verifyAuthToken, async (req, res) => {
    const user = await User.findOne({ email: req.body.email })
    const chirp = new Chirp({
        text: req.body.text
    })
    const savedChirp = await chirp.save()

    // ! TODO: Handle file uploads
    // ! TODO: Add newly savedChirp to user.chirps
})


module.exports = router
