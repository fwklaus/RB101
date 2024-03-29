
def remove_vowels(arr)
  arr.map do |word|
    word.chars.map do |char|
      if char.match?(/[aeiou]/i)
        ''
      else
        char
      end
    end.join
  end
end

p remove_vowels(%w(abcdefghijklmnopqrstuvwxyz)) == %w(bcdfghjklmnpqrstvwxyz)
p remove_vowels(%w(green YELLOW black white)) == %w(grn YLLW blck wht)
p remove_vowels(%w(ABC AEIOU XYZ)) == ['BC', '', 'XYZ']