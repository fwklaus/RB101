# Write a method that takes an array of strings, and returns an array of the
# same string values, except with the vowels (a, e, i, o, u) removed.

def remove_vowels(voweled_arr)
 count = 0
 loop do
   break if count >= voweled_arr.size
   voweled_arr[count].delete!("/[aeiouAEIOU]/")
   count += 1
  end
  voweled_arr
end

p remove_vowels(%w(abcdefghijklmnopqrstuvwxyz)) == %w(bcdfghjklmnpqrstvwxyz)
p remove_vowels(%w(green YELLOW black white)) == %w(grn YLLW blck wht)
p remove_vowels(%w(ABC AEIOU XYZ)) == ['BC', '', 'XYZ']


#_launch_solution____

def remove_vowels(strings)
  strings.map { |string| string.delete('aeiouAEIOU') }
end