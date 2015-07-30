midi     = require 'midi'
inquirer = require 'inquirer'

# requiring our default transport, so the socket server gets initiated
emit = require './transports/socket-io'
channel = emit.channel

# Set up a new input.
input = new midi.input()
midiConnector = {}

initPort = (portIndex) ->
  input.openPort portIndex
  console.log " - Listening MIDI"

  input.on "message", (deltaTime, msg) ->
    return unless msg?
    # Don't send if it's a velocity update
    return unless msg.length == 3
    # Don't send if it's a keyOff
    return if msg[0] in [128, 129]

    console.log "Received message", msg

    note = msg[1]
    velocity = msg[2]

    emit.sendMessage
      note: note,
      velocity: velocity

console.log ' + Helloooo'

inputs = []
for index in [0..input.getPortCount()-1]
  inputs.push
    name : input.getPortName index
    value: index

# inquirer question
inquirer.prompt
  name    : 'port_index'
  default : 0
  type    : 'list'
  message : 'Please select your midi input' # select you midi input bitch
  choices : inputs
, ( answer ) ->
  initPort(answer.port_index)



# Close the port when done.
# input.closePort()

###
# ~ WE ARE NEVER DONE
###
