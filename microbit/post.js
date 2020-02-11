radio.onReceivedString(function (receivedString) {
	// console.log("[" + port + "] recieved")
	waiting = false
	// console.log(receivedString)
	serial.writeLine(receivedString)
})
input.onButtonPressed(Button.A, function () {
	radio.setGroup(port)
	// console.log("[" + port + "] requested.")
	radio.sendString("request")
	// console.log("[" + port + "] waiting...")
	waiting = true
})
let waiting = false
let port = 0
port = 216
basic.forever(function () {
	radio.setGroup(port)
	// console.log("[" + port + "] requested.")
	radio.sendString("request")
	// console.log("[" + port + "] waiting...")
	waiting = true
})
