midi     = require 'midi'
inquirer = require 'inquirer'

# requiring our default transport, so the socket server gets initiated
emit = require './transports/socket-io'
channel = emit.channel

# Set up a new input.
input = new midi.input()
midiConnector = {}
launchpad = {}

mapButtonToLaunchpad = (note) -> 
  if note % 8 == 0 && ((note / 8) % 2 == 1)
      return [8, Math.floor(note / 8 / 2)]

  x = note % 8
  y = Math.floor(note / 8) / 2
  return [x, y]


initLaunchpad = (portIndex) ->
	input.openPort portIndex
	midiConnector = require('midi-launchpad').connect(portIndex)
	console.log " - Listening MIDI"

	midiConnector.on "ready", (pad) ->
	  console.log "Launchpad ready"
	  launchpad = pad

	  launchpad.on "press", (btn) ->
	  	emit.sendMessage
	  		x: btn.x
	  		y: btn.y
	  		state: btn.getState()
	  		special: btn.special
	  		note: btn.toNote()

channel.on 'launchpad-key-color', (msg) ->
	map = mapButtonToLaunchpad(msg[0])
	button = launchpad.getButton(map[0],map[1])
	button.light(launchpad.colors.red.high)

# Get the name of a specified input port.
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
	initLaunchpad(answer.port_index)



# Close the port when done.
# input.closePort()

###
# ~ WE ARE NEVER DONE
###