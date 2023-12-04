puts "What is your name?"
name = gets.chomp


case name[-1]
when '!' 
  puts "HELLO #{name.upcase}. WHY ARE WE SCREAMING!"
else
  puts "Hello #{name}."
end