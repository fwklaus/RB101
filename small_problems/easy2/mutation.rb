# What will the following code print, and why?

array1 = %w(Moe Larry Curly Shemp Harpo Chico Groucho Zeppo)
array2 = []
array1.each { |value| array2 << value }
array1.each { |value| value.upcase! if value.start_with?('C', 'S') }
puts array2


# We print array 2 with each value on a seperate line. Each  element that starts
# with 'C' or 'S' is converted to uppercase. Each element of the second array
# is assigned to each value from the first array. The elements of both arrays point to the 
# same objects. When the upcase! is called destrcutively on each element of array 
# 1, array 2 still points at the objects being modified. 

# You can avoid this problem by not making destrucive calls on the inner array
# elements directly, but only on the outer array. This feature can lead to 
# unexpected behavior
