import serial
import requests
ser=serial.Serial("/dev/ttyUSB0",115200)
url="https://example.io"
while True:
	requests.post(url,ser.readline());