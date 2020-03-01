import serial
import requests
ser=serial.Serial("/dev/ttyUSB0",115200)
url="https://example.io"
while True:
	data = ser.readline().split(" ")
	temperature = data[2]

	if temperature >= 35:
		requests.post(url,ser.readline())