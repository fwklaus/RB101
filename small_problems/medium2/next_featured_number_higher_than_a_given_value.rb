# input: integer
# output: integer

# rules:
#   -explicit:
#      -"featured number" - odd number and multiple of 7 whose digits occur exactly once
#      -takes a single integer as an argument
#      - returns the next featured number greater than the argument
#      - returns an error message if no next featured number

# 49 -> featured number
# 98 -> not a featured number(not odd)
# 97 -> not a featured number(not a multiple of 7)
# 133 -> not a featured number(digit 3 appears twice)

### DataStructures/Algorithm:
# int..
# odd?
# int % 7 == 0
# to_s.chars.uniq.join.to_i
#
# - take integer
# - set count variable to current int
# - increment count
# - perform checks on number
# - check if int is odd
#       -if not odd, return error
# - check if int is multiple of 7
#       -if not multiple of 7, return error
# - check if there are no repeating numbers in int
#        - if there are repeating errors, return error


def featured(int)
  next_number = int + 1
  (next_number..).each do |int|
    break if next_number >= 9_876_543_210
    if next_number.odd? && next_number % 7 == 0 &&
      next_number.to_s.chars.uniq.join.to_i == next_number
      return next_number 
    else
      next_number+= 1
     end
  end 
  "There is no possible number that fulfills those requirements"
end

p featured(12) == 21
p featured(20) == 21
p featured(21) == 35
p featured(997) == 1029
p featured(1029) == 1043
p featured(999_999) == 1_023_547
p featured(999_999_987) == 1_023_456_987

p featured(9_999_999_999) # -> There is no possible number that fulfills those requirements

