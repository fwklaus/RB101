# Write a method that takes a String of digits, and returns the appropriate
# number as an integer. 
NUMBERS = { "0" => 0,
            "1" => 1,
            "2" => 2,
            "3" => 3,
            "4" => 4,
            "5" => 5,
            "6" => 6,
            "7" => 7,
            "8" => 8,
            "9" => 9 }

def string_to_integer(str)
    int_array = str.split(//).each_with_object([]) do |idx, memo|
    memo << NUMBERS.fetch(idx)
  end
    int_array.inject(0){|memo, idx| (memo * 10) + idx }
end
=begin
def string_to_signed_integer(str)
  if str.start_with?('+')
      string_to_integer(str.delete('+'))
  elsif str.start_with?('-')
      -string_to_integer(str.delete('-'))
  else
       string_to_integer(str) 
  end
  
end


#__launch_solution_________

def string_to_signed_integer(string)
  case string[0]
  when '-' then -string_to_integer(string[1..-1])
  when '+' then string_to_integer(string[1..-1])
  else          string_to_integer(string)
  end
end
=end

#__further_exploration______

def string_to_signed_integer(string)
  str = string[1..-1]
  convert = string_to_integer(str)
  
  case string[0]
  when '-' then -convert
  when '+' then  convert
  else           string_to_integer(string)
  end
end


p string_to_signed_integer('4321') == 4321
p string_to_signed_integer('-570') == -570
p string_to_signed_integer('+100') == 100