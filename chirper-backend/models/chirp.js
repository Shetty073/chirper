const mongoose = require('mongoose')
const { Schema } = mongoose


const chirpSchema = new Schema({
    // TODO: Add a replyTo field to show which chirp is this chirp replying to (if any)
    text: {
        type: String,
        required: true,
        trim: true
    },
    photos: [
        {
            type: String,
        }
    ],
    video: {
        type: String,
    },
    author: {
        type: mongoose.Schema.Types.ObjectId,
        ref: 'User'
    },
    mentions: [
        {
            type: mongoose.Schema.Types.ObjectId,
            ref: 'User'
        }
    ],
    likedBy: [
        {
            type: mongoose.Schema.Types.ObjectId,
            ref: 'User'
        }
    ],
    rechirpedBy: [
        {
            type: mongoose.Schema.Types.ObjectId,
            ref: 'User'
        }
    ],
    replies: [
        {
            type: mongoose.Schema.Types.ObjectId,
            ref: 'Chirp'
        }
    ],
    quoteChirp: {
        type: mongoose.Schema.Types.ObjectId,
        ref: 'Chirp'
    }
}, { timestamps: true })

module.exports = mongoose.model('Chirp', chirpSchema)
