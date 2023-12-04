def short_long_short(str1, str2)
  short, long = nil, nil
  
  if str1.size > str2.size
     short, long = str2, str1
  else
     short, long = str1, str2
  end

  short + long + short
end

p short_long_short('abc', 'defgh') == "abcdefghabc"
p short_long_short('abcde', 'fgh') == "fghabcdefgh"
p short_long_short('', 'xyz') == "xyz"