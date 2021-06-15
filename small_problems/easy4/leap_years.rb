# Part 1)

# Input: Integer(year)
# Output: boolean

# Rules:
#   -Explicit:
#       - takes a year greater than 0
#       - returns true if year is leap year
#       - years greater than 0

#  leap year
# - occurs in every year evenly divisible by 4
#         -unless year is also evenly divisible by 100
#                  -unless year is evenly divisible by 400 


## Data Structures/Algorithm
# - take year
# - conditional check on year (if statement)
## check least common conditions first  ##
#      -if year is evenly divisible by 400 (%, ==)
#      -if year is evenly divisible by 100 and 400 (%, ==)
#      -else every year evenly divisible by 4 is leap year(%, ==)



def leap_year?(year)
  if year % 400 == 0
    true
  elsif year % 100 == 0
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
p leap_year?(1700) == false
p leap_year?(1) == false
p leap_year?(100) == false
p leap_year?(400) == true
 


# Further Exploration___________________________________________________________
# rewrite leap_year to perform tests in the opposite direction


## opposite
# if year is evenly divisible by 4 
#   true 
#      -unless year is evenly divisible by 100 
#                  -unless year is evenly divisble by 400


def leap_year?(year)
  return true if year % 4 == 0 && !(year % 100 == 0)
  return true if year % 100 == 0 && year % 400 == 0
  false
end

#___or


def leap_year?(year)
  if year % 4 == 0 && year % 100 != 0
    true  
  elsif  year % 4 == 0 && year % 100 == 0 && year % 400 == 0
    true
  else 
    false
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
p leap_year?(1700) == false
p leap_year?(1) == false
p leap_year?(100) == false
p leap_year?(400) == true

#_______________________________________________________________________________
# Part 2

# The British Empire adopted the Gregorian Calendar in 1752, which was a leap
# year. Prior to 1752, the Julian Calendar was used. Under the Julian Calendar,
# leap years occur in any year that is evenly divisible by 4.

# Using this information, update the method from the previous exercise to
# determine leap years both before and after 1752.


def leap_year?(year)
  if year <= 1752
    year % 4 == 0
  else
    if year % 400 == 0
      true
    elsif year % 100 == 0
      false
    else 
      year % 4 == 0
    end
  end
end


#__or________

def leap_year?(year)
  if year <= 1752
    year % 4 == 0
  else
    if year % 4 == 0 && year % 100 != 0
      true  
    elsif  year % 4 == 0 && year % 100 == 0 && year % 400 == 0
      true
    else 
      false
    end 
  end
end

#____or_________

def leap_year?(year)
  if year <= 1752
    year % 4 == 0
  else
    (year % 400 == 0) || (year % 4 == 0) && (year % 100 != 0) 
  end
end

#___launch_solution____

def leap_year?(year)
  if year < 1752 && year % 4 == 0
    true
  elsif year % 400 == 0
    true
  elsif year % 100 == 0
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
=end