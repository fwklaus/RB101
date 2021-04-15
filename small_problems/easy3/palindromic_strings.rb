#_Part_1____________________________
# Write a method that returns true if the string passed as an argument is a
# palindrome, false otherwise. A palindrome reads the same forward and
# backward. For this exercise, case matters as does punctuation and spaces.

=begin
def palindrome?(str)
  str.reverse == str ? true : false
end


puts palindrome?('madam') == true
puts palindrome?('Madam') == false
puts palindrome?("madam i'm adam") == false
puts palindrome?('356653') == true

#__________launch_solution___________________

def palindrome?(string)
  string == string.reverse
end
#___________further_exploration_______________
# takes a string or an array object

def palindrome?(obj)
  obj.to_s.split.join.reverse == obj.to_s.split.join
end


p palindrome?('121') == true
p palindrome?('madam') == true
p palindrome?('Madam') == false

=end

#_Part_2___________________________________________
# Write another method that returns true if the string passed as an argument
# is a palindrome, false otherwise. This time, however, your method should be
# case-insensitive, and it should ignore all non-alphanumeric characters. If
# you wish, you may simplify things by calling the palindrome? method you wrote
# in the previous exercise.

def real_palindrome?(str)
  filtered_insensitive_string = str.downcase.delete("^0-9a-z")
  filtered_insensitive_string.reverse == filtered_insensitive_string
end


p real_palindrome?('madam') == true
p real_palindrome?('Madam') == true 
p real_palindrome?("Madam, I'm Adam") == true
p real_palindrome?('356653') == true
p real_palindrome?('356a653') == true
p real_palindrome?('123ab321') == false