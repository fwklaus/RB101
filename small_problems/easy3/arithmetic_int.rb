puts "Enter the first number:"
num1 = gets.chomp.to_i

puts "Enter the second number:"
num2 = gets.chomp.to_i


add = num1 + num2
subtract = num1 - num2
mult = num1 * num2
div = num1 / num2
mod = num1 % num2
pow = num1 ** num2

puts "#{num1} + #{num2} = #{add}"
puts "#{num1} - #{num2} = #{subtract}"
puts "#{num1} * #{num2} = #{mult}"
puts "#{num1} / #{num2} = #{div}"
puts "#{num1} % #{num2} = #{mod}"
puts "#{num1} ** #{num2} = #{pow}"


