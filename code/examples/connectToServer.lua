tmr.stop(1)
print("set up wifi mode")
wifi.setmode(wifi.STATION)
wifi.sta.config("Park Plaza Hotels & Resorts","") 
wifi.sta.connect()

tmr.alarm(1, 1000, 1, function() 
    if wifi.sta.getip()== nil then 
         print("IP unavaiable, Waiting...") 
    else 
     tmr.stop(1)
     print("Config done, IP is "..wifi.sta.getip())
    end 
 end)
 
function checkNetwork ()
  conn = nil
  conn=net.createConnection(net.TCP, 0)

  conn:on("connection", function(conn, payload) 
    print('\nConnected')
    print(payload)
    conn:send("GET /sinceId?since=0&tag=TWDE"
      .." HTTP/1.1\r\n" 
      .."Host: twitter-activity-tracker.herokuapp.com\r\n"
      .."Connection: close\r\n"
      .."Accept: */*\r\n" 
      .."User-Agent: Mozilla/4.0 (compatible; esp8266 Lua; Windows NT 5.1)\r\n" 
      .."\r\n")
  end) 

  conn:on("receive", function(sck, c) print(c) end )
  conn:connect(80,'twitter-activity-tracker.herokuapp.com')
end


