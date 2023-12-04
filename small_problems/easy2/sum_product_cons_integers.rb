puts ">> Please enter an integer greater than 0:"
int = gets.chomp.to_i

puts ">> Enter 's' to compute the sum, 'p' to compute the product."
operation = gets.chomp

result = case operation
         when 's' 
          (1..int).reduce(:+)  
         when 'p'
          (1..int).reduce(:*)
         end

op = operation == 's' ? 'sum' : 'product'

puts "The #{op} of the integers between 1 and #{int} is #{result}."


