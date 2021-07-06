const jwt = require("jsonwebtoken")

const verifyAuthToken = (req, res, next) => {
    const token = req.header("Authorization")
    if (!token)
        return res.status(400).json({
            success: false,
            message: "Access denied",
        })

    try {
        const verified = jwt.verify(token, process.env.TOKEN_SECRET)
        req.user = verified
        next()
    } catch (err) {
        return res.status(400).json({
            success: false,
            message: "Invalid token",
        })
    }
}

module.exports.verifyAuthToken = verifyAuthToken