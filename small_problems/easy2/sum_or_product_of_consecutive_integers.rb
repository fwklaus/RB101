# Write a program that asks the user to enter an integer greater than 0, then
# asks if the user wants to determine the sum or product of all numbers between
# 1 and the entered integer.


def prompt(str)
  puts ">> #{str}"
end

def result (n, op)
  arr = []
  n.downto(1){|num| arr << num}
  result = 0

  if op == 's'
    arr.map{|num| result += num}
  else
    result += 1
    arr.map{|num| result *= num}
  end
  result
end

def op (char)
  if char == 'p'
    return 'product'
  else
    return 'sum'
  end
end

prompt("Please enter an integer greater than 0: ")
int = gets.chomp.to_i

prompt("Enter an 's' to compute the sum, 'p' to compute the product: ")
operation = gets.chomp

prompt("The #{op(operation)} of the integers between 1 and #{int} is #{result(int,operation)}")


# Further Exploration___________________________________________________________

def prompt(str)
  puts ">> #{str}"
end

def result(n, op)
  arr = (1..n)
  total = 0
  if op == 's'
    total = arr.inject(:+)
  else
    total += 1
    total = arr.inject(:*)
  end
  total
end

def op(char)
  char == 'p' ? 'product' : 'sum'
end

def valid_number?(int)
  int > 0 && int.class == Integer ? true : false
end

def valid_operation?(op)
  op == 'p' || op == 's' ? true : false
end

int = 0
loop do 
prompt("Please enter an integer greater than 0: ")
int = gets.chomp.to_i
  if valid_number?(int)
    break
  else
    prompt "Invalid: Please enter integer greater than 0: "
  end
end

operation = ''
loop do
prompt("Enter an 's' to compute the sum, 'p' to compute the product: ")
operation = gets.chomp
  if valid_operation?(operation)
    break
  else
    prompt "Invalid: Please enter 'p' for product, or 's' for sum: "
  end
end

prompt("The #{op(operation)} of the integers between 1 and #{int} is #{result(int,operation)}")
