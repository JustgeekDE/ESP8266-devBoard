cfg={}
cfg.ssid="ESP Test AP"
cfg.pwd="password"


wifi.setmode(wifi.SOFTAP)
wifi.ap.config(cfg)
