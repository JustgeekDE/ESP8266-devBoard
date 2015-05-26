
pinLED = 3
timerId = 0
intervallMs = 500

tmr.stop(timerId)
gpio.mode(pinLED, gpio.OUTPUT)
state = 0

tmr.alarm(timerId, intervallMs, 1, function()
    if state then
      gpio.write(pin, gpio.HIGH)
    else
      gpio.write(pin, gpio.LOW)
    end
    state = 1 - state
  end
)
