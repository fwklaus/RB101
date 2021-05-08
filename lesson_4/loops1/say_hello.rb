# Modify the code below so "Hello!" is printed 5 times.

say_hello = true

=begin
while say_hello
  5.times{|_| puts "hello"}
  say_hello = false
end
=end

count = 1

while say_hello
  say_hello = false if count >= 5
  puts 'Hello!'
  count +=1
end
