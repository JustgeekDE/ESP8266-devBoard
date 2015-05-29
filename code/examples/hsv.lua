hue = 0
stepSize = 2
frequency = 30

function toInt(floating)
  return math.floor(floating * 255)
end

function HSL(hue, saturation, lightness)
    hue = hue % 360
    if saturation < 0 or saturation > 1 then
        return string.char(0, 0, 0)
    end
    if lightness < 0 or lightness > 1 then
        return string.char(0, 0, 0)
    end

    local chroma = (1 - math.abs(2 * lightness - 1)) * saturation
    local h = hue/60
    local x =(1 - math.abs(h % 2 - 1)) * chroma
    local r, g, b = 0, 0, 0
    if h < 1 then
        r,g,b=chroma,x,0
    elseif h < 2 then
        r,b,g=x,chroma,0
    elseif h < 3 then
        r,g,b=0,chroma,x
    elseif h < 4 then
        r,g,b=0,x,chroma
    elseif h < 5 then
        r,g,b=x,0,chroma
    else
        r,g,b=chroma,0,x
    end
    local m = lightness - chroma/2
    return string.char(toInt(r+m),toInt(g+m),toInt(b+m))
end

tmr.alarm(0, frequency, 1, function()
  data = ""
  for i = 1, 5, 1 do
    data = data .. HSL(hue + (i*stepSize), 1, 0.3)
  end
  ws2812.writergb(4, data)
  hue = hue + stepSize
end )
