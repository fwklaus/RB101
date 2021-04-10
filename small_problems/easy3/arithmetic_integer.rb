# Write a program that prompts the user for two positive integers, and then
# prints the results of the following operations on those two numbers:
# addition, subtraction, product, quotient, remainder, and power. Do not worry
# about validating the input.

puts "Enter the first number: "
first = gets.chomp.to_i

puts "Enter the second number: "
second = gets.chomp.to_i

def operations(int1, int2)
  puts "#{int1} + #{int2} = #{int1 + int2}"
  puts "#{int1} - #{int2} = #{int1 - int2}"
  puts "#{int1} * #{int2} = #{int1 * int2}"
  puts "#{int1} / #{int2} = #{int1 / int2}"
  puts "#{int1} % #{int2} = #{int1 % int2}"
  puts "#{int1} ** #{int2} = #{int1 ** int2}"

end

operations(first, second)

#___________________launch_solution___________________

def prompt(message)
  puts "==> #{message}"
end

prompt("Enter the first number:")
first_number = gets.chomp.to_i
prompt("Enter the second number:")
second_number = gets.chomp.to_i

prompt("#{first_number} + #{second_number} = #{first_number + second_number}")
prompt("#{first_number} - #{second_number} = #{first_number - second_number}")
prompt("#{first_number} * #{second_number} = #{first_number * second_number}")
prompt("#{first_number} / #{second_number} = #{first_number / second_number}")
prompt("#{first_number} % #{second_number} = #{first_number % second_number}")
prompt("#{first_number} ** #{second_number} = #{first_number**second_number}")


# Must consider edge cases. Can't divide by 0 for instance.
# Converting inputs to floats rather than integers would allow for division
# operations that would normally result in 0 between integers 

