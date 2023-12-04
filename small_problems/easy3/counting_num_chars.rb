puts "Please write word or multiple words:"
sequence = gets.chomp
count = 0

sequence.chars.each do |char|
  count += 1 unless char.match?(/[\s]/)
end

puts "There are #{count} characters in #{sequence}."