# Write a method that takes a year as input and returns the century. The return
# value should be a string that begins with the century number, and ends with
# st, nd, rd, or th as appropriate for that number.

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


#_____launch_solution______________________

def century(year)
  century = year / 100 + 1
  century -= 1 if year % 100 == 0
  century.to_s + century_suffix(century)
end

def century_suffix(century)
  return 'th' if [11, 12, 13].include?(century % 100)
  last_digit = century % 10

  case last_digit
  when 1 then 'st'
  when 2 then 'nd'
  when 3 then 'rd'
  else 'th'
  end
end