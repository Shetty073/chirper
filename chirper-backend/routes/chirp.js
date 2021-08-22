const router = require('express').Router()
const User = require('../models/user')
const Chirp = require('../models/chirp')
const { verifyAuthToken } = require('../verifytoken')

// multer for handling multipart form data
const multer  = require('multer')
const storage = multer.diskStorage({
    destination: function (req, file, cb) {
        let fs = require('fs')
        if(!fs.existsSync(`uploads/${req.user._id}`)) {
            fs.mkdirSync(`uploads/${req.user._id}`)
        }
        cb(null, `uploads/${req.user._id}`)
    },
    filename: function (req, file, cb) {
        let path = require('path')
        let fileName = Date.now() + path.extname(file.originalname)
        cb(null, fileName)
        req.body.fileName = fileName
    }
})
const upload = multer({ storage: storage })


// Chirp endpoints
// create chirp (this endpoint handles multipart\form data due to file upload)
router.post('/create', [verifyAuthToken, upload.single('photo')], async (req, res) => {
    console.log(req.body)
    // const user = await User.findById(req.body.userId)
    // const chirp = new Chirp({
    //     text: req.body.text
    // })
    // const savedChirp = await chirp.save()

    // ! TODO: Complete this

    return res.status(200).json({
        success: true,
        user: 'user',
    })
})


module.exports = router
