def crunch(str)
  arr = []
  str.chars.each do |char|
    next if arr.last == char
    arr << char
  end
  arr.join
end

p crunch('ddaaiillyy ddoouubbllee') == 'daily double'
p crunch('4444abcabccba') == '4abcabcba'
p crunch('ggggggggggggggg') == 'g'
p crunch('a') == 'a'
p crunch('') == ''