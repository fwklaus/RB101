require "pry"


# normalize the degrees
SECONDS_PER_MINUTE = 60
MINUTES_PER_DEGREE = 60

DEGREE = "\xC2\xB0"

def dms(degrees)
  seconds = normalize_degrees(degrees)
  minutes, seconds = seconds.divmod(60)
  degrees, minutes = minutes.divmod(60)

  format(%(%01d#{DEGREE}%02d'%02d"), degrees, minutes, seconds)
end

def normalize_degrees(degrees)
  degrees * MINUTES_PER_DEGREE * SECONDS_PER_MINUTE
end

p dms(30) == %(30°00'00")
p dms(76.73) == %(76°43'48")
p dms(254.6) == %(254°36'00")
p dms(93.034773) == %(93°02'05")
p dms(0) == %(0°00'00")
p dms(360) == %(360°00'00") || dms(360) == %(0°00'00")