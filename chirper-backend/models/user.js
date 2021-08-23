const mongoose = require('mongoose')
const { Schema } = mongoose


const userSchema = new Schema({
    name: {
        type: String,
        required: true,
        trim: true,
        minLength: 3,
        maxLength: 50,
        message: 'Please provide a valid name'
    },
    username: {
        type: String,
        required: true,
        unique: true,
        minLength: 3,
        maxLength: 50,
        message: 'Please provide a valid username'
    },
    photo: {
        type: String,
    },
    email: {
        type: String,
        required: true,
        trim: true,
        unique: true,
        minLength: 6,
        maxLength: 255,
        message: 'Please provide a valid email'
    },
    password: {
        type: String,
        required: true,
        select: false,
        minLength: 6,
        maxLength: 1024,
        message: 'Please provide a valid password'
    },
    dob: {
        type: Date,
        required: true,
        message: 'Please provide a valid date of birth'
    },
    location: {
        type: String,
        trim: true
    },
    isBot: {
        type: Boolean,
        default: false,
    },
    chirps: [
        {
            type: mongoose.Schema.Types.ObjectId,
            ref: 'Chirp'
        }
    ],
    feed: [
        {
            type: mongoose.Schema.Types.ObjectId,
            ref: 'Chirp'
        }
    ],
    replies: [
        {
            type: mongoose.Schema.Types.ObjectId,
            ref: 'Chirp'
        }
    ],
    pinnedChirp: {
        type: mongoose.Schema.Types.ObjectId,
        ref: 'Chirp'
    },
    following: [
        {
            type: mongoose.Schema.Types.ObjectId,
            ref: 'User'
        }
    ],
    followers: [
        {
            type: mongoose.Schema.Types.ObjectId,
            ref: 'User'
        }
    ]
}, { timestamps: true })

module.exports = mongoose.model('User', userSchema)
