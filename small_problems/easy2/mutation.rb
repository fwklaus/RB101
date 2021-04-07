# What will the following code print, and why?

array1 = %w(Moe Larry Curly Shemp Harpo Chico Groucho Zeppo)
array2 = []
array1.each { |value| array2 << value }
array1.each { |value| value.upcase! if value.start_with?('C', 'S') }
puts array2

# Line 3 initializes a new array. Line 4 initializes an empty array.
# On line 5, the concatenation operator appends values from array1 to array2
# so that array2 is identical to array1. Line 6 calls upcase destructively
# on the value its invoked upon if the value starts with a capital C, or
# capital S. This will mutate array1. Array1 and array2 are pointing at
# different arrays, but the String objects in those arrays are pointing to the
# same objects in memory, so the mutation will affect both arrays. The puts
# on line 7 will reflect that, and display the array with each
# element on its own line





