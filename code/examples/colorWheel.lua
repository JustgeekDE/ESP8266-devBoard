r = 0
g = 255
b = 0

count = 1

function getColor(count)
  count = count % 6 
  if count == 0 then return string.char(255,0,0)
  elseif count == 1 then return string.char(255,255,0)
  elseif count == 2 then return string.char(0,255,0)
  elseif count == 3 then return string.char(0,255,255)
  elseif count == 4 then return string.char(0,0,255)
  elseif count == 5 then return string.char(255,0,255)
  end
  return string.char(255,255,255)
end

tmr.alarm(0, 500, 1, function()
  data = ""
  for i = 1, 5, 1 do
    data = data .. getColor(count + i)
  end
  ws2812.writergb(4, data)
  count = count + 1
end )

