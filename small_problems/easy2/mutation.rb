=begin
We initialize a local variable `array1` to an array containing names represented by strings
We initialize a local variale `array2` to an empty array 
We then iterate over each element in `array1` by calling method `each`, and apped each element of the array to `array` 2, by calling `<<` on `array2`, passing an element on each iteration as an argument. On `line 4` we then iterate over `array1` again, and call the destructive `upcase!` method on each element that starts with string `C` or `S`. 
This call will not mutate the values in `array2`, only `array1`, since we are operatiing directly on the value, and not some variable shared by both arrays that references the same value.

Correction:
The mutated values appear in both arrays, as `array2` contains the same string objects as `array1`. 

=end


array1 = %w(Moe Larry Curly Shemp Harpo Chico Groucho Zeppo)
array2 = []
array1.each { |value| array2 << value }
array1.each { |value| value.upcase! if value.start_with?('C', 'S') }
puts array2

array1.each do |el|
  puts el.object_id
end

array2.each do |el2|
  puts el2.object_id
end
