array = (1..99).to_a

# array.each do |num|
#   puts num if num.even?
# end

arr = array.select do |num|
  num.even?
end

puts arr

