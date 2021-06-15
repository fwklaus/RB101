# Input: Integer(year)
# Output: String(century)

# Rules:
#   -Explicit:
#        -takes a year as input
#        -returns the century
#            -return value is a string that begins with century number
#            -ends with the appropriate ending(st,nd,rd,th)
#        -new centuries begin in years that end with year (01)
#                       20th century - 1901 - 2000

## Data Structures/Algorithm

## determine century prefix:
# - divide by modulo 10 to get last digit
# - divide year by 100 to get century number
#       -add one unless year ends with 0

## determine century suffix:
# - perform check on prefix
#    - 



def get_suffix(year)
  #least common conditions first
  #need to check last two digits
  return "th" if [11,12,13].include?(year % 100)
  # check last digit
  endings = year % 10
  
  case endings
  when 0    then "th"
  when 1    then "st"
  when 2    then "nd"
  when 3    then "rd"
  when 4..9 then "th"
  end
  
end

def get_prefix(year)
  year % 100 == 0 ? (year / 100) : (year / 100) + 1 
end


def century(year)
 prefix = get_prefix(year)
 suffix = get_suffix(prefix)
 prefix.to_s + suffix
end


p century(2000) == '20th'     
p century(2001) == '21st'
p century(1965) == '20th'
p century(256) == '3rd'
p century(5) == '1st'
p century(10103) == '102nd'
p century(1052) == '11th'
p century(1127) == '12th'
p century(11201) == '113th'


=begin
def century(year)
 century = (year % 100) == 0 ? (year/100) : ((year/100) + 1)
 century.to_s + ending(century) 
end

def ending(century)
 digits = century % 100
 if (10..20).cover?(digits)
  "th"
 else
  digits = digits % 10
  case digits
  when 1         then "st"
  when 2         then "nd"
  when 3         then "rd"
  when 0 || 4..9 then "th"
  end
 end
end

p century(2000) == '20th'
p century(2001) == '21st'
p century(1965) == '20th'
p century(256) == '3rd'
p century(5) == '1st'
p century(10103) == '102nd'
p century(1052) == '11th'
p century(1127) == '12th'
p century(11201) == '113th'
=end