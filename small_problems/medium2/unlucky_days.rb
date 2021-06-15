# input: integer(year)
# output: integer (number of Friday the 13ths in a given year)

# rules:
#   -explict: 
#      -takes an integer(year)
#      -returns the number of Friday the 13ths in a given year
#      -assume the year is greater than 1752
#      -assume the Gregorian calender will remain in use indefinitely 


### DataStructures/Algorithm:
# Time
# Time#new
# Time#friday?
# upto
#
# - for a given year
# - from January to December
# - check if the 13th is a friday
# - if the 13th is a Friday, incrment the count



def friday_13th(yr)
  fridays = 0
  
  1.upto(12) do |month|
    if Time.new(yr,month,13).friday?
      fridays += 1
    end
  end
  
  fridays  
end








p friday_13th(2015) == 3
p friday_13th(1986) == 1
p friday_13th(2019) == 2