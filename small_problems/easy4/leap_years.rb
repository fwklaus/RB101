# part 1
def leap_year?(year)
  if year % 400 == 0
    true
  elsif year % 100 == 0 && year % 4 == 0
    false
  else
    year % 4 == 0
  end
end

# p leap_year?(2016) == true
# p leap_year?(2015) == false
# p leap_year?(2100) == false
# p leap_year?(2400) == true
# p leap_year?(240000) == true
# p leap_year?(240001) == false
# p leap_year?(2000) == true
# p leap_year?(1900) == false
# p leap_year?(1752) == true
# p leap_year?(1700) == false
# p leap_year?(1) == false
# p leap_year?(100) == false
# p leap_year?(400) == true



# part 2

def leap_year?(year)
  return year % 4 == 0 if year <= 1752

  if year % 400 == 0
    true
  elsif year % 100 == 0 && year % 4 == 0
    false
  else
    year % 4 == 0
  end
end


p leap_year?(2016) == true
p leap_year?(2015) == false
p leap_year?(2100) == false
p leap_year?(2400) == true
p leap_year?(240000) == true
p leap_year?(240001) == false
p leap_year?(2000) == true
p leap_year?(1900) == false
p leap_year?(1752) == true
p leap_year?(1700) == true
p leap_year?(1) == false
p leap_year?(100) == true
p leap_year?(400) == true