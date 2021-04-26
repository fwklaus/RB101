# Part 1

# Write a method that takes a time represented as the number of minutes
# before or after midnight in 24 hour format (hh:mm). Your method should work
# with any integer input.
=begin

MINUTES_PER_DAY = 1440
MIDNIGHT = 0

def time_of_day(time)
  hours = 0
  minutes = 0
  days = 0
  if time < 0 && time >= -1440
    hours, minutes = (MINUTES_PER_DAY - time.abs).divmod(60)
  elsif time > 0 && time <= 1440
    hours, minutes = (MIDNIGHT + time).divmod(60)
  elsif time < 0 && time < -1440
    hours, minutes = time.divmod(60)
    days, hours = hours.divmod(24)
    string_time(hours,minutes)
  elsif time > 0 && time > 1440
    hours, minutes = time.divmod(60)
    days, hours = hours.divmod(24)
    string_time(hours,minutes)
  end
  string_time(hours, minutes)    
end

def string_time(hours, minutes)
    hours = "%02d" % hours
    minutes = "%02d" % minutes
    
    "#{hours}:#{minutes}"
end
p time_of_day(0) == "00:00"
p time_of_day(-3) == "23:57"
p time_of_day(35) == "00:35"
p time_of_day(-1437) == "00:03"
p time_of_day(3000) == "02:00"
p time_of_day(800) == "13:20"
p time_of_day(-4231) == "01:29"


#__launch_solution_______

MINUTES_PER_HOUR = 60
HOURS_PER_DAY = 24
MINUTES_PER_DAY = HOURS_PER_DAY * MINUTES_PER_HOUR

def normalize_minutes_to_0_through_1439(minutes)
  while minutes < 0
    minutes += MINUTES_PER_DAY
  end

  minutes % MINUTES_PER_DAY
end

def time_of_day(delta_minutes)
  delta_minutes = normalize_minutes_to_0_through_1439(delta_minutes)
  hours, minutes = delta_minutes.divmod(MINUTES_PER_HOUR)
  format('%02d:%02d', hours, minutes)
end
=end
#_______________________________________________________________________________
# Part 2

# Write two methods that each take a time of day in 24 hour format, and return
# the number of minutes before and after midnight, respectively. Both methods
# should return a value in the range 0..1439.

MINUTES_PER_DAY = 1440
MINUTES_PER_HOUR = 60
HOURS_PER_DAY = 24

def after_midnight(time)
  hours = (time[0..1].to_i) * MINUTES_PER_HOUR
  minutes = (time[3..4].to_i)
  time_in_minutes = hours + minutes
  time_in_minutes == MINUTES_PER_DAY ? 0 : time_in_minutes
end

def before_midnight(time)
  hours = (time[0..1].to_i) * MINUTES_PER_HOUR
  minutes = (time[3..4].to_i)
  time_in_minutes = ((hours + minutes) - MINUTES_PER_DAY).abs
  time_in_minutes == MINUTES_PER_DAY ? 0 : time_in_minutes
end


p after_midnight('00:00') == 0
p before_midnight('00:00') == 0
p after_midnight('12:34') == 754
p before_midnight('12:34') == 686
p after_midnight('24:00') == 0
p before_midnight('24:00') == 0

#_launch_solution_____

HOURS_PER_DAY = 24
MINUTES_PER_HOUR = 60
MINUTES_PER_DAY = HOURS_PER_DAY * MINUTES_PER_HOUR

def after_midnight(time_str)
  hours, minutes = time_str.split(':').map(&:to_i)
  (hours * MINUTES_PER_HOUR + minutes) % MINUTES_PER_DAY
end

def before_midnight(time_str)
  delta_minutes = MINUTES_PER_DAY - after_midnight(time_str)
  delta_minutes = 0 if delta_minutes == MINUTES_PER_DAY
  delta_minutes
end



