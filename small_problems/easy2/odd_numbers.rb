array = (1..99).to_a

array.each do |num|
  puts num if num.odd?
end
