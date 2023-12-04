# Part 1
=begin
def palindrome?(str)
  str.reverse == str
end

p palindrome?('madam') == true
p palindrome?('Madam') == false          # (case matters)
p palindrome?("madam i'm adam") == false # (all characters matter)
p palindrome?('356653') == true
=end

# Part 2
# case-insensitive and ignore all non-alphanumeric characters


def real_palindrome?(str)
  str = str.downcase.delete("^a-zA-Z0-9")
  str.reverse == str
end

p real_palindrome?('madam') == true
p real_palindrome?('Madam') == true           # (case does not matter)
p real_palindrome?("Madam, I'm Adam") == true # (only alphanumerics matter)
p real_palindrome?('356653') == true
p real_palindrome?('356a653') == true
p real_palindrome?('123ab321') == false