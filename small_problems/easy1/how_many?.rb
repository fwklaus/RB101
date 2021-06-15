# Input: array
# output: print element name alongside number of occurences

# Rules:
#  -Explicit:
#     -takes array
#     -words in array are-case sensitive
#     -print each element alongside the number of occurences
#

## DataStructures/Algorithm:
# -initialize a hash ({})
#     -iterate over vehicles array (uniq, each)
#          -save elements as hash keys
#          -save count for element at current iteration as value of that key
#          -need the keys to represent unique values
#          -need the values to represent count for each of those keys

=begin

vehicles = [
  'car', 'car', 'truck', 'car', 'SUV', 'truck',
  'motorcycle', 'motorcycle', 'car', 'truck'
]

def count_occurences(arr)
  occurences = {}
  
  arr.uniq.each{|el| occurences[el] = arr.count(el)}
  
  occurences.each do |key,value|
    puts "#{key} => #{value}"
  end
end


count_occurences(vehicles)
=end

# Further Exploration___________________________________________________________
# case-insensitive

# want the count to be case insensitive 
# - need to make a copy of the array with all downcase elements


vehicles = [
  'car', 'car', 'truck', 'car', 'SUV','suv', 'truck',
  'motorcycle', 'motorcycle', 'car','TruCk', 'truck'
]



def count_occurences(arr)
  occurences = {}
  lowercase_arr = arr.map(&:downcase)
  
  lowercase_arr.uniq.each do |el|
    
    occurences[el] = lowercase_arr.count(el)
  end
  
  occurences.each do |key,value|
    puts "#{key} => #{value}"
  end
end


count_occurences(vehicles)