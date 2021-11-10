const mongoose = require('mongoose')
const { Schema } = mongoose


const hashTagSchema = new Schema({
    tag: {
        type: String,
        required: true,
        trim: true
    },
    count: {
        type: Number,
        default: 1,
    },
}, { timestamps: true })

module.exports = mongoose.model('HashTag', hashTagSchema)
