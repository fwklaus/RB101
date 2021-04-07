# Write a method that counts the number of occurrences of each element in
# a given array.

vehicles = [
  'car', 'car', 'truck', 'car', 'SUV', 'truck',
  'motorcycle', 'motorcycle', 'car', 'truck'
]


# The words in the array are case-sensitive: 'suv' != 'SUV'. ` Once counted,
# print each element alongside the number of occurrences.

def count_occurrences(arr)
  occurrences = {}
  
  arr.uniq.each do |ele|
    occurrences[ele] = arr.count(ele)   
  end
  
  occurrences.each{|ele, count| puts "#{ele} => #{count}" }
  
end  
  
count_occurrences(vehicles)