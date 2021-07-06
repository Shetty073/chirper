const express = require('express')
const cors = require('cors')
const app = express()
const dotenv = require('dotenv')
const mongoose = require('mongoose')
const jwt = require('jsonwebtoken')


// import routes
const authRoutes = require("./routes/auth")
const chirpRoutes = require("./routes/chirp")
const userRoutes = require("./routes/user")


dotenv.config()

// connect to db
mongoose.connect(process.env.DB_CONNECT, {useNewUrlParser: true, useUnifiedTopology: true}, () => 
console.log('Connected to database.'))

// Middlewares
app.use(express.urlencoded({ extended: true }))
app.use(express.json())
app.use(cors())

// route middlewares
app.use("/api/auth", authRoutes)
app.use("/api/chirp", chirpRoutes)
app.use("/api/user", userRoutes)

// Handling request for invalid URI
app.use(function (req, res, next) {
    let obj = { success: false }
    if (req.method === "DELETE") {
        obj.message = "DELETE method not supported"
    } else {
        obj.message = "Invalid URI"
    }
    return res.status(404).json(obj)
})

// Start the server
const PORT = process.env.PORT || 3000
app.listen(PORT, () => {
    console.log(`Server started on http://192.168.1.100:${PORT}`)
})
