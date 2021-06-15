# Write a method that returns true if its integer argument is palindromic,
# false otherwise. A palindromic number reads the same forwards and backwards.

def palindromic_number?(int)
  int.to_s.reverse.to_i == int
end



p palindromic_number?(34543) == true
p palindromic_number?(123210) == false
p palindromic_number?(22) == true
p palindromic_number?(5) == true


# Further Exploration___________________________________________________________

# The method does not work with leading zeroes. to_s automatically performs
# octal conversion on numbers with leading zeroes




=begin
#_________launch_solution________________________
# invoked palindrome? method from previous exercise

def palindromic_number?(number)
  palindrome?(number.to_s)
end

=end


