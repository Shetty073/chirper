const router = require('express').Router()
const User = require('../models/user')
const HashTag = require('../models/hashtag')
const Chirp = require('../models/chirp')
const shared = require('../shared')
const { verifyAuthToken } = require('../verifytoken')
const { extractRichItems } = require('../helpers')
const multer  = require('multer')


// hashtag endpoints
router.post('/tag', verifyAuthToken, async (req, res) => {
    const hashtags = await HashTag.find({tag: { $regex: '.*' + req.body.tag + '.*' }})

    return res.status(200).json({
        success: true,
        hashtags: hashtags,
    })
})


router.get('/trending', verifyAuthToken, async (req, res) => {
    const trending = await HashTag.find({}, 'tag count', {
        limit:10,
        sort:{
            count: -1
        }
    })

    return res.status(200).json({
        success: true,
        trending: trending,
    })
})


// multer for handling multipart form data
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
    // console.log(req.body)
    try {
        const user = await User.findById(req.user._id)
        let chirpText = req.body.chirp
        let chirp

        let hashtags = extractRichItems(chirpText, '#')
        console.log(hashtags)
        for (let ht of hashtags) {
            let tag = ht.id
            await HashTag.findOneAndUpdate({
                tag: tag
            }, {
                $inc: {count: 1}
            }, {
                upsert: true, new: true, setDefaultsOnInsert: true
            })
        }

        // let mentions = extractRichItems(chirpText, '@')
        // for (let mention of mentions) {
        //     let username = mention.id
        //     await User.findOne({
        //         username: username
        //     }, (err, user) => {
        //         if(user) {
                    // TODO: emit websocket message regarding the mention
        //         } else {
        //             chirpText.replace(`@[@${username}](${username})`, username)
        //         }
        //     })
        // }

        if(req.body.fileUrl !== undefined || req.body.fileUrl !== '') {
            chirp = new Chirp({
                text: chirpText,
                photos: [req.body.fileUrl],
                author: user,
            })
        } else {
            chirp = new Chirp({
                text: chirpText,
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
                $push: {
                    feed: {
                        $each: [savedChirp],
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
