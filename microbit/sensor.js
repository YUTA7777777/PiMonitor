radio.onReceivedString(function (receivedString) {
	// console.log(receivedString)//for debug
	if (receivedString == "reqest") {
		radio.sendString(port + " " + BME280.pressure(BME280_P.Pa) + " " + BME280.temperature(BME280_T.T_C) + " " + BME280.humidity())
	}
})
let port = 0
port = 216
radio.setGroup(port)
