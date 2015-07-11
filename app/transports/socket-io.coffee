handler = (req, res) ->
  fs.readFile __dirname + "/index.html", (err, data) ->
    if err
      res.writeHead 500
      return res.end("Error loading index.html")
    res.writeHead 200
    res.end data
    return

app = require("http").createServer(handler)
io = require("socket.io")(app)
fs = require("fs")

Backbone = require 'backbone'
_ = require 'underscore'

channel = {}
_.extend channel, Backbone.Events

app.listen 1337

io.on "connection", (socket) ->

  console.log '+ client connected'

  socket.emit "hello",
    message: "Hello Earthling"
    data   : any_dummy_date: can_come_here: on

  socket.on "launchpad-key-color", (msg) ->
    console.log "got a key color"
    channel.trigger('launchpad-key-color', msg)

module.exports.sendMessage = ( message ) -> io.sockets.send message
module.exports.channel = channel
