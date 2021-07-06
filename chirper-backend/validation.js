const Joi = require("joi")

// User register validation
const registerDataValidation = (reqBody) => {
    const schema = Joi.object({
        name: Joi.string().min(3).required(),
        email: Joi.string().min(6).required().email(),
        password: Joi.string().min(6).required(),
        dob: Joi.date().required()
    })

    return schema.validate(reqBody)
}

// User login validation
const loginDataValidation = (reqBody) => {
    const schema = Joi.object({
        email: Joi.string().min(6).required().email(),
        password: Joi.string().min(6).required()
    })

    return schema.validate(reqBody)
}

module.exports.registerDataValidation = registerDataValidation
module.exports.loginDataValidation = loginDataValidation