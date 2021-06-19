=begin
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


# input: float
# output: string

# rules:
#   -explicit:
#      -takes a float
#          -angle between 0 and 360 degrees
#         - returns a String
#              -angle in degrees, minutes, and seconds
# degree symbol: ° - handles the number before the decimal
# minutes: ' - handles the remainder
# seconds: " - handles the remainder
# use two digit numbers with leading zeroes when formatting minutes and seconds

# DataStructure/Algorithm
# how do we get the degrees?
# normalize the number
# convert the angle to seconds



# format output string for degrees minutes and seconds - format
# 360 degrees
# 60 minutes in a degree
# 60 seconds in a minute


DEGREE = "\xC2\xB0"
SECONDS_PER_MINUTE = 60
MINUTES_PER_DEGREE = 60
SECONDS_PER_DEGREE  = SECONDS_PER_MINUTE * MINUTES_PER_DEGREE

def dms(angle)
  total_seconds = (angle * SECONDS_PER_DEGREE).floor
  minutes_in_seconds,seconds = total_seconds.divmod(SECONDS_PER_MINUTE)
  degrees,minutes = minutes_in_seconds.divmod(MINUTES_PER_DEGREE)

 %(#{degrees}#{DEGREE}#{format("%.02d", minutes)}'#{format("%.02d", seconds)}")
  
end

p dms(30) == %(30°00'00")
p dms(76.73) == %(76°43'48")
p dms(254.6) == %(254°36'00")
p dms(93.034773) == %(93°02'05")
p dms(0) == %(0°00'00")
p dms(360) == %(360°00'00") || dms(360) == %(0°00'00")

=end

## Further_Exploration
# normalize input 

# until number is in range of 0..360 - until
# subtract 360 from numbers greater than 360 
# add 360 to numbers less than 360



DEGREE = "\xC2\xB0"
SECONDS_PER_MINUTE = 60
MINUTES_PER_DEGREE = 60
SECONDS_PER_DEGREE  = SECONDS_PER_MINUTE * MINUTES_PER_DEGREE


def normalize_dms(angle)
  until (0..360).include?(angle)
    angle > 360 ? angle -= 360 : angle += 360
  end
  angle  
end


def dms(angle)
  normalized_angle = angle
  if angle > 360 || angle < 0
    normalized_angle = normalize_dms(angle)
  end

  total_seconds = (normalized_angle * SECONDS_PER_DEGREE).floor
  minutes_in_seconds,seconds = total_seconds.divmod(SECONDS_PER_MINUTE)
  degrees,minutes = minutes_in_seconds.divmod(MINUTES_PER_DEGREE)

 %(#{degrees}#{DEGREE}#{format("%.02d", minutes)}'#{format("%.02d", seconds)}")
  
end




p dms(400) == %(40°00'00")
p dms(-40) == %(320°00'00")
p dms(-420) == %(300°00'00")