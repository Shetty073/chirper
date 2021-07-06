const mongoose = require('mongoose')
const { Schema } = mongoose


const userSchema = new Schema(
    {
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
        email: {
            type: String,
            required: true,
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
        isBot: {
            type: Boolean,
            default: false,
        },
    }
)

module.exports = mongoose.model('User', userSchema)
