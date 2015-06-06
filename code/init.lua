buttonPin = 3
rgbPin = 4
timerId = 0

counter = 0
gpio.mode(buttonPin, gpio.OUTPUT, gpio.PULLUP)
ws2812.writergb(rgbPin,string.char(0, 0, 0):rep(5))

print(wifi.sta.getmac())
 
tmr.stop(timerId)
tmr.alarm(timerId, 500, 1, function()
  if counter < 5 then
    ws2812.writergb(rgbPin,string.char(64, 0, 0):rep(counter))
    counter = counter + 1
  else
    ws2812.writergb(rgbPin, string.char(0, 64, 0):rep(5))
  end
  if gpio.read(buttonPin) == 0 then
    counter = 0
    print(wifi.sta.getmac())
    ws2812.writergb(rgbPin,string.char(0, 0, 0):rep(5))
  end
end )
