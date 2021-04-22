# Write a method that takes an Array of numbers, and returns an Array with the
# same number of elements, and each element has the running total from the
# original Array.

=begin
def running_total(ary)
  total = 0
  ary.map do |num|
    total += num
    num = total
  end
end


#_launch_solution_____

def running_total(array)
  sum = 0
  array.map { |value| sum += value }
end
=end

#_further_exploration______

def running_total(ary)
  total = 0
  ary.each_with_object([]){ |idx, memo| memo << total += idx}
end


p running_total([2, 5, 13]) == [2, 7, 20]
p running_total([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
p running_total([3]) == [3]
p running_total([]) == []


