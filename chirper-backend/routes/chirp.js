const router = require('express').Router()
const User = require('../models/user')
const Chirp = require('../models/chirp')
const shared = require('../shared')
const { verifyAuthToken } = require('../verifytoken')


// multer for handling multipart form data
const multer  = require('multer')
const storage = multer.diskStorage({
    destination: function (req, file, cb) {
        let fs = require('fs')
        let destination = `uploads/${req.user._id}`
        if(!fs.existsSync(destination)) {
            fs.mkdirSync(destination)
        }
        cb(null, destination)
    },
    filename: function (req, file, cb) {
        let path = require('path')
        let fileName = Date.now() + path.extname(file.originalname)
        req.body.fileUrl = `${req.protocol}://${req.get('host')}/${req.user._id}/${fileName}`
        cb(null, fileName)
    }
})
const upload = multer({ storage: storage })

// Chirp endpoints
// create chirp (this endpoint handles multipart\form data due to file upload)
router.post('/create', [verifyAuthToken, upload.single('photo')], async (req, res) => {
    console.log(req.body)
    try {
        const user = await User.findById(req.user._id)
        let chirp
        if(req.body.fileUrl !== undefined || req.body.fileUrl !== '') {
            chirp = new Chirp({
                text: req.body.chirp,
                photos: [req.body.fileUrl],
                author: user,
            })
        } else {
            chirp = new Chirp({
                text: req.body.chirp,
                author: user,
            })
        }

        const savedChirp = await chirp.save()

        const userUpdateStatus = await User.updateOne({_id: req.user._id}, {
            $push: {
                chirps: savedChirp,
                feed: savedChirp,
            },
        })

        // send chirp to client via socket.io event
        user.followers.forEach(user => {
            shared.io.to(user._id).emit('chirp', savedChirp);
        });

        // update the followers feed
        await User.updateMany(
            {
                _id: {
                        $in: user.followers,
                    }
            },
            {
                // $push: {
                //     feed: savedChirp,
                // },
                $push: {
                    feed: {
                        $each: savedChirp,
                        $sort: { updatedAt: -1 }
                    },
                },
            }
        )

        return res.status(200).json({
            success: true,
            nModified: userUpdateStatus.nModified,
            chirp: savedChirp
        })
    } catch (err) {
        return res.status(400).json({
            success: false,
            message: err.message,
        })
    }
})


module.exports = router
