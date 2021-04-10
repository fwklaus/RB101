# Write a program that solicits 6 numbers from the user, then
# prints a message that describes whether or not the 6th number
# appears amongst the first 5 numbers.

def prompt (str)
  puts ">> #{str}"
end

def valid?(int)
  if int > 0
    true
  else
    false
    prompt("Invalid number, please enter positive number...")
  end
end

def appears?(bool)
  bool ? "appears" : "does not appear"  
end

loop do
  num_array = []
  flag = false
  last_number = 0
    
  prompt("Enter the 1st number: ")
  loop do
    number1 = gets.chomp.to_i
    if valid?(number1)
      num_array << number1
      break
    end
  end
  
  
  prompt("Enter the 2nd number: ")
  loop do
    number2 = gets.chomp.to_i
    if valid?(number2)
      num_array << number2
      break
    end
  end
  
  prompt("Enter the 3rd number: ")
  loop do
    number3 = gets.chomp.to_i
    if valid?(number3)
      num_array << number3
      break
    end
  end
  
  prompt("Enter the 4th number: ")
  loop do
    number4 = gets.chomp.to_i
    if valid?(number4)
       num_array << number4
       break
    end
  end
  
  prompt("Enter the 5th number: ")
  loop do
    number5 = gets.chomp.to_i
    if valid?(number5)
      num_array << number5
      break
    end
  end
  
  prompt("Enter the last number: ")
  loop do
    last_number = gets.chomp.to_i
    if valid?(last_number)
      num_array.map do |num|
        if last_number == num
          flag = true
        end
      end
      break
    end
  end
  
  prompt("The number #{last_number} #{appears?(flag)} in #{num_array}.")
  
  prompt("Try again?(Enter 'y' for yes)")
  answer = gets.chomp
  break unless answer.downcase == 'y'

end

#_____________________launch_solution_____________________________

numbers = []

puts "Enter the 1st number:"
numbers << gets.chomp.to_i
puts "Enter the 2nd number:"
numbers << gets.chomp.to_i
puts "Enter the 3rd number:"
numbers << gets.chomp.to_i
puts "Enter the 4th number:"
numbers << gets.chomp.to_i
puts "Enter the 5th number:"
numbers << gets.chomp.to_i
puts "Enter the last number:"
last_number = gets.chomp.to_i

if numbers.include? last_number
  puts "The number #{last_number} appears in #{numbers}."
else
  puts "The number #{last_number} does not appear in #{numbers}."
end

