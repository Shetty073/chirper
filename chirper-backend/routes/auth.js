const router = require('express').Router()
const bcrypt = require('bcryptjs')
const jwt = require('jsonwebtoken')
const User = require('../models/user')
const {
    registerDataValidation,
    loginDataValidation
} = require('../validation')
const { verifyAuthToken } = require('../verifytoken')


// authentication endpoints
router.post('/register', async (req, res) => {
    // Validate the data before creating a user
    const { error } = registerDataValidation(req.body)
    if (error) {
        res.status(400).json({
            success: false,
            message: error.details[0].message,
        })
    }

    // Check if the user already exists in the database
    const emailExist = await User.findOne({ email: req.body.email })
    if (emailExist) {
        res.status(400).json({
            success: false,
            message: 'Account already exists',
        })
    }

    // Salt and hash the password before storing it
    const salt = await bcrypt.genSalt(10)
    const hashedPassword = await bcrypt.hash(req.body.password, salt)

    // Create a new user
    let username = req.body.email.substr(0, req.body.email.search('@'));
    const user = new User({
        name: req.body.name,
        username: username.length < 3 ? `${username}_chirp` : username,
        email: req.body.email,
        password: hashedPassword,
        dob: Date.parse(req.body.dob)
    })

    try {
        const savedUser = await user.save()
        const token = jwt.sign({ _id: user._id }, process.env.TOKEN_SECRET)

        res.header('Authorization', token).status(200).json({
            success: true,
            user: savedUser
        })

    } catch (err) {
        console.log(err)
        res.status(400).json({
            success: false,
            message: err.message,
        })
    }
})

router.post('/login', async (req, res) => {
    // Validate the data before we login a user
    const { error } = loginDataValidation(req.body)
    if (error)
        res.status(400).json({
            success: false,
            message: error.details[0].message,
        })

    // Check if the user already exists in the database
    const user = await User.findOne({ email: req.body.email }, '_id email password')
    if (!user)
        res.status(400).json({
            success: false,
            message: 'Email id or password is invalid',
        })

    // Check if the password matches
    const validPass = await bcrypt.compare(req.body.password, user.password)

    // If the password doesn't match send error message
    if (!validPass)
        res.status(400).json({
            success: false,
            message: 'Email id or password is invalid',
        })

    // If the password matches create jsonwebtoken and send it back via header
    const token = jwt.sign({ _id: user._id }, process.env.TOKEN_SECRET)
    const userWithoutPassword = await User.findOne({ email: req.body.email })
    res.header('Authorization', token).status(200).json({
        success: true,
        user: userWithoutPassword
    })
})

// This endpoint returns the User object for the requested username
router.post('/', verifyAuthToken, (req, res) => {
    User.findOne(
        {
            username: req.body.username,
        },
        function (err, user) {
            if (err) {
                res.status(400).json({
                    success: false,
                    message: 'User not found!',
                })
            }

            res.status(200).json({
                success: true,
                user: user,
            })
        }
    )
})


module.exports = router
