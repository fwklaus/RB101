# Write a method that takes a floating point number that represents an angle
# between 0 and 360 degrees and returns a String that represents that angle in
# degrees, minutes and seconds.


DEGREE = "\xC2\xB0"
MINUTES_PER_DEGREE = 60
SECONDS_PER_MINUTE = 60

def dms(angle)
  degrees, minutes, seconds = 0, 0, 0
  deg_arr = [degrees,minutes,seconds]
  if angle == 0
    deg_arr
  elsif angle % angle.floor == 0
    deg_arr[0] = angle
  else
    deg_arr[0] = angle.floor
    minutes = ((angle % angle.floor) * MINUTES_PER_DEGREE)
    seconds = ((minutes % minutes.floor) * SECONDS_PER_MINUTE)
    deg_arr[1] = minutes.floor
    deg_arr[2] = seconds.floor
  end
  %Q(#{deg_arr[0]}#{DEGREE}#{format("%02d",deg_arr[1] )}'#{format("%02d", deg_arr[2])}")
end


puts dms(30) == %(30°00'00")
puts dms(76.73) == %(76°43'48")
puts dms(254.6) == %(254°36'00")
puts dms(93.034773) == %(93°02'05")
puts dms(0) == %(0°00'00")
puts dms(360) == %(360°00'00") || dms(360) == %(0°00'00")

#_launch_solution______

DEGREE = "\xC2\xB0"
MINUTES_PER_DEGREE = 60
SECONDS_PER_MINUTE = 60
SECONDS_PER_DEGREE = MINUTES_PER_DEGREE * SECONDS_PER_MINUTE

def dms(degrees_float)
  total_seconds = (degrees_float * SECONDS_PER_DEGREE).round
  degrees, remaining_seconds = total_seconds.divmod(SECONDS_PER_DEGREE)
  minutes, seconds = remaining_seconds.divmod(SECONDS_PER_MINUTE)
  format(%(#{degrees}#{DEGREE}%02d'%02d"), minutes, seconds)
end

