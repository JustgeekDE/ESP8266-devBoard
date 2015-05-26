pinLED = 3
intervallMs = 500

gpio.mode(pinLED, gpio.OUTPUT)

while true do
  gpio.write(pin, gpio.HIGH)
  tmr.delay(intervallMs)
  gpio.write(pin, gpio.LOW)
  tmr.delay(intervallMs)
end
