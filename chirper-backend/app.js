const express = require('express')
const cors = require('cors')
const app = express()
const dotenv = require('dotenv')
const mongoose = require('mongoose')
const shared = require('./shared')
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
app.use(express.json())
app.use(express.urlencoded({ extended: true }))
app.use(cors({exposedHeaders: 'Authorization'}))
app.use(express.static('uploads'))

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



// socket.io configuration
const http = require("http").createServer(app)
const options = { /* ... */ }
const io = require("socket.io")(http, options)
shared.io = io

let connections = 0
// Socket.io code
io.use((socket, next) => {
    // if (socket.handshake.query && socket.handshake.query.token) {
    //     jwt.verify(
    //         socket.handshake.query.token,
    //         process.env.TOKEN_SECRET,
    //         function (err, decoded) {
    //             if (err) return next(new Error("Authentication error"))
    //             socket.decoded = decoded
    //             next()
    //         }
    //     )
    // } else {
    //     next(new Error("Authentication error"))
    // }
    next()
}).on("connection", (socket) => {
    // Whenever a new socket connects increment the connections counter and console.log()
    // the active user count.
    connections++
    console.log(`${socket.id} has joined`)
    console.log(`Clients connected: ${connections}`)

    socket.on('join', (userId) => {
        socket.join(userId)
        shared.users[socket.id] = userId
        socket.emit('joined', 'Successfully joined!')
        console.log(shared.users)
    })

    // socket.on("message", (message) => {
    //     socket.broadcast.to(message.chatid).emit("message", message.body)
    // })

    // Whenever a socket disconnects decrement the connections counter and console.log()
    // the active user count.
    socket.on('disconnect', () => {
        delete shared.users[socket.id]
        connections--
        console.log(`Clients connected: ${connections}`)
    })
})

// Start the server
const PORT = process.env.PORT || 3000
http.listen(PORT, () => {
    console.log(`Server started on http://192.168.1.100:${PORT}`)
})
