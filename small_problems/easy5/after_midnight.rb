=begin
PROBLEM: tell time given integer

input: integer
output: string
mutating?:

rules:
   -explicit:
      - takes integer
          - before or after midnight
      - return string
          - formatted in standard time

      - do not use Date or Time classes
   -implicit:
      
     
unclear parts of problem?:
1440 minutes/day
examples/test_cases:


data/alg:
    Create constant representing minutes/day
    - if integer is less than 0
         - time before midnight
            - subtract minutes from minutes per day
    - if integer is greater
         - time after midnight
            - add minutes to 0
    - if minutes is greater than minutes/day
         - normalize time
=end


MINUTES_PER_DAY = 1440
MINUTES_PER_HOUR = 60

def time_of_day(int)
  if int < 0
    time_before_midnight(int)
  else
    time_after_midnight(int)
  end
end

def time_before_midnight(min)
  min += MINUTES_PER_DAY until min >= -MINUTES_PER_DAY
  min = MINUTES_PER_DAY - min.abs
  hour, minutes = min.divmod(60)

  format("%02d:%02d", hour, minutes)
end

def time_after_midnight(min)
  min -= MINUTES_PER_DAY until min <= MINUTES_PER_DAY
  hour, minutes = min.divmod(60)
  
  format("%02d:%02d", hour, minutes)
end

p time_of_day(0) == "00:00"
p time_of_day(-3) == "23:57"
p time_of_day(35) == "00:35"
p time_of_day(-1437) == "00:03"
p time_of_day(3000) == "02:00"
p time_of_day(800) == "13:20"
p time_of_day(-4231) == "01:29"



# part 2
# input: string
# output: integer

# return integer
#    - minutes before and after midnight respectively

MINUTES_AT_MIDNIGHT = 0

def after_midnight(time)
  hours, minutes = time.split(":").map(&:to_i)
  total_min = (hours * 60) + minutes
  return 0 if total_min == MINUTES_PER_DAY
  
  MINUTES_AT_MIDNIGHT + total_min
end

def before_midnight(time)
  hours, minutes = time.split(":").map(&:to_i)
  total_min = (hours * 60) + minutes
  return 0 if total_min == MINUTES_AT_MIDNIGHT

  MINUTES_PER_DAY - total_min
end

p after_midnight('00:00') == 0
p before_midnight('00:00') == 0
p after_midnight('12:34') == 754
p before_midnight('12:34') == 686
p after_midnight('24:00') == 0
p before_midnight('24:00') == 0
