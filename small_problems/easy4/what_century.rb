def century(century)
  century = determine_century(century)
  ending = get_ending(century)
  century + ending
end

def determine_century(year)
  if year.to_s[-1] == '0'
    (year / 100).to_s
  else
    ((year / 100) + 1).to_s
  end
end

def get_ending(cen)
  return "th" if ["11", "12", "13"].include?(cen[-2..])

  case cen[-1]
  when "1"           then "st"
  when "2"           then "nd"
  when "3"           then "rd"
  when "0", "4".."9" then "th"
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