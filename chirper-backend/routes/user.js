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

// multer config for handling multipart form data
const multer  = require('multer')
const profilePhotoStorage = multer.diskStorage({
    destination: function (req, file, cb) {
        let fs = require('fs')
        let destination = `uploads/${req.user._id}/profile_photo`
        if(!fs.existsSync(destination)) {
            fs.mkdirSync(destination, {recursive: true})
        } else {
            // remove old profile_photo dir and then create the new one
            fs.rmdirSync(destination, { recursive: true });
            fs.mkdirSync(destination, {recursive: true})
        }
        cb(null, destination)
    },
    filename: function (req, file, cb) {
        let path = require('path')
        let fileName = Date.now() + path.extname(file.originalname)
        req.body.fileUrl = `${req.protocol}://${req.get('host')}/${req.user._id}/profile_photo/${fileName}`
        cb(null, fileName)
    }
})
const profilePhotoUpload = multer({ storage: profilePhotoStorage })

// This endpoint returns the User object for the requested username
router.post('/profilephoto/change', [verifyAuthToken, profilePhotoUpload.single('photo')], async (req, res) => {
    console.log(req.body)

    try {
        const userUpdateStatus = await User.updateOne({_id: req.user._id}, {
            photo: req.body.fileUrl,
        })
        const user = await User.findById(req.user._id)

        return res.status(200).json({
            success: true,
            nModified: userUpdateStatus.nModified,
            profilePhoto: user.photo
        })

    } catch (err) {
        return res.status(400).json({
            success: false,
            message: err.message,
        })
    }
})

module.exports = router