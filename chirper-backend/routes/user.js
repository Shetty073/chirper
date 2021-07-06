const router = require('express').Router()
const User = require('../models/user')
const { verifyAuthToken } = require('../verifytoken')


// This endpoint returns the User object for the requested username
router.post('/', verifyAuthToken, (req, res) => {
    User.findOne({
            username: req.body.username,
        },
        (err, user) => {
            if (err) {
                return res.status(400).json({
                    success: false,
                    message: 'User not found!',
                })
            }

            return res.status(200).json({
                success: true,
                user: user,
            })
        }
    )
})

module.exports = router