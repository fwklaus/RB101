# Write a method that takes a year as input and returns the century. The return
# value should be a string that begins with the century number, and ends with
# st, nd, rd, or th as appropriate for that number.

def century(year)
 century = (year % 100) == 0 ? (year/100) : ((year/100) + 1)
 
end

p century(2000)# == '20th'
p century(2001)# == '21st'
p century(1965)# == '20th'
p century(256)# == '3rd'
p century(5)# == '1st'
p century(10103)# == '102nd'
p century(1052)# == '11th'
p century(1127)# == '12th'
p century(11201)# == '113th'


# last_char = century.slice(-1)
=begin
  if (year % 100) == 0
              (year/100).to_s
            else 
              ((year/100) + 1).to_s
            end
=end
=begin
  last_one = century.slice(-1)
 endings  = { "1" => "st",
              "2" => "nd",
              "3" => "rd",
              "4" => "th" }
 case last_one
   when  then endings["1"] 
 
 century
  
   


=begin
last_two = { "10".."20" => "th",
             
  
}
=end

=begin
def ending(century)
  if century.length == 1
  
            
            if (century.length == 1)
              case last_char
              when "1"             then "st"
              when "2"             then "nd"
              when "3"             then "rd"
              when "0" || "4".."9" then "th"
              end
            elsif century.length >= 2 && 
              
            end
  century << ending
end
=end