# part 1

def reverse_sentence(str)
  str.split(' ').reverse.join(' ')
end

puts reverse_sentence('Hello World') == 'World Hello'
puts reverse_sentence('Reverse these words') == 'words these Reverse'
puts reverse_sentence('') == ''
puts reverse_sentence('    ') == '' # Any number of spaces results in ''


# part 2


def reverse_words(word)
  word.split(' ').map do |wrd|
    if wrd.size >= 5
      wrd.chars.reverse.join
    else
      wrd
    end
  end.join(' ')
end



puts reverse_words('Professional') == "lanoisseforP"
puts reverse_words('Walk around the block') == "Walk dnuora the kcolb"
puts reverse_words('Launch School') == "hcnuaL loohcS"