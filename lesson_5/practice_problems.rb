# Practice Problems:
=begin
# 1)
arr = ['10', '11', '9', '7', '8']

p arr.sort{ |a,b| b.to_i <=> a.to_i }
# 2)
books = [
  {title: 'One Hundred Years of Solitude', author: 'Gabriel Garcia Marquez', published: '1967'},
  {title: 'The Great Gatsby', author: 'F. Scott Fitzgerald', published: '1925'},
  {title: 'War and Peace', author: 'Leo Tolstoy', published: '1869'},
  {title: 'Ulysses', author: 'James Joyce', published: '1922'}
]

x = books.sort_by do |book|
  book[:published]
end

puts x

# 3)

arr1 = ['a', 'b', ['c', ['d', 'e', 'f', 'g']]]
arr1[2][1][3]

arr2 = [{first: ['a', 'b', 'c'], second: ['d', 'e', 'f']}, {third: ['g', 'h', 'i']}]
arr2[1][:third][0]

arr3 = [['abc'], ['def'], {third: ['ghi']}]
arr3[2][:third][0][0]


hsh1 = {'a' => ['d', 'e'], 'b' => ['f', 'g'], 'c' => ['h', 'i']}
hsh1['b'][1]

hsh2 = {first: {'d' => 3}, second: {'e' => 2, 'f' => 1}, third: {'g' => 0}}
hsh2[:third].keys[0]

# 4)

arr1 = [1, [2, 3], 4]
arr1[1][1] = 4

arr2 = [{a: 1}, {b: 2, c: [7, 6, 5], d: 4}, 3]
arr2[2] = 4

hsh1 = {first: [1, 2, [3]]}
hsh1[:first][2][0] = 4

hsh2 = {['a'] => {a: ['1', :two, 3], b: 4}, 'b' => 5}
hsh2[["a"]][:a][2] = 4

# 5)

sum = 0

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

munsters.each_value{ |value| sum += value["age"] if value["gender"] == "male"}

# 6)


munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

munsters.each do |key, value|
  puts "#{key} is a #{value["age"]}-year-old #{value["gender"]}."
end


# 7)

a = 2
b = [5, 8]
arr = [a, b]

arr[0] += 2
arr[1][0] -= a

p arr
p a, b

# 8)

hsh = {first: ['the', 'quick'], second: ['brown', 'fox'],
  third: ['jumped'], fourth: ['over', 'the', 'lazy', 'dog']}
  
hsh.each do |_,value|
  value.each do |word|
    word.delete!('^aeiou')
    puts word
  end
end

#_launch_solution

vowels = 'aeiou'

hsh.each do |_, value|
  value.each do |str|
    str.chars.each do |char|
      puts char if vowels.include?(char)
    end
  end
end
# e
# u
# i
# o
# o
# u
# e
# o
# e
# e
# a
# o
  
  
# 9)

arr = [['b', 'c', 'a'], [2, 1, 3], ['blue', 'black', 'green']]

new_arr = arr.map do |ele|
  ele.sort{ |a,b| b <=> a}
end

p new_arr

#_launch_solution____

new_arr = arr.map do |sub_arr|
  sub_arr.sort do |a, b|
    b <=> a
  end
end
# => [["c", "b", "a"], [3, 2, 1], ["green", "blue", "black"]]

# 10)

arr = [{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}]

new_arr = arr.map do |sub_hsh|
  hash = {}
  sub_hsh.each do |key,value|
    hash[key] = value + 1
  end
  hash
end


# 11)

arr = [[2], [3, 5, 7], [9], [11, 13, 15]]

new_arr = []

arr.each do |sub_arr|
  new_arr << sub_arr.select{ |num| num % 3 == 0}
end

p new_arr

#_launch_solution____

arr.map do |element|
  element.select do |num|
    num % 3 == 0
  end
end
# => [[], [3], [9], [15]]


# 12)

arr = [[:a, 1], ['b', 'two'], ['sea', {c: 3}], [{a: 1, b: 2, c: 3, d: 4}, 'D']]
# expected return value: {:a=>1, "b"=>"two", "sea"=>{:c=>3}, {:a=>1, :b=>2, :c=>3, :d=>4}=>"D"}

hash = {}

arr.each{|key, value| hash[key] = value}

puts hash

#_launch_solution__

hsh = {}
arr.each do |item|
  hsh[item[0]] = item[1]
end
hsh # => {:a=>1, "b"=>"two", "sea"=>{:c=>3}, {:a=>1, :b=>2, :c=>3, :d=>4}=>"D"}

# 13)

arr = [[1, 6, 7], [1, 4, 9], [1, 8, 3]]

new_arr = arr.sort_by do |sub_arr|
    sub_arr.select{ |num| num.odd? } 
end

p new_arr



# 14)

hsh = {
  'grape' => {type: 'fruit', colors: ['red', 'green'], size: 'small'},
  'carrot' => {type: 'vegetable', colors: ['orange'], size: 'medium'},
  'apple' => {type: 'fruit', colors: ['red', 'green'], size: 'medium'},
  'apricot' => {type: 'fruit', colors: ['orange'], size: 'medium'},
  'marrow' => {type: 'vegetable', colors: ['green'], size: 'large'},
}

arr = []

hsh.each do |key,value|
  value.each do |key,value|
    if key == :colors
      arr << value.map{|el| el.capitalize}
    elsif key == :size
      arr << value.upcase
    end
  end
end

p arr


#_launch_solution

hsh.map do |_, value|
  if value[:type] == 'fruit'
    value[:colors].map do |color|
      color.capitalize
    end
  elsif value[:type] == 'vegetable'
    value[:size].upcase
  end
end
# => [["Red", "Green"], "MEDIUM", ["Red", "Green"], ["Orange"], "LARGE"]


# 15)


arr = [{a: [1, 2, 3]}, {b: [2, 4, 6], c: [3, 6], d: [4]}, {e: [8], f: [6, 10]}]

# new_arr = arr.map do |sub_hsh|
#   sub_hsh.select do |key, value|
#     sub_hsh[key].all?(&:even?)
#   end
# end

# puts new_arr

new_arr = arr.select do |sub_hsh|
  sub_hsh.all? do |key, value|
    value.all? {|num| num.even?}
  end
end

puts new_arr

=end

# 16)

# rules:
#   32 hex characters
#       -0..9 as string
#       -a..f
#   broken into 5 sections 8-4-4-4-12
#   no parameters
#   randomly produce hex characters

def uuid
  hex_chars = %w(0 1 2 3 4 5 6 7 8 9 a b c d e f )
  section = [8,4,4,4,12]
  
  uuid = ""
  section.each do |int|
    int.times do |_|
      uuid << hex_chars.sample 
    end
    uuid << ?- unless uuid.length >= 32
  end
  uuid
end


# launch_solution___

def generate_UUID
  characters = []
  (0..9).each { |digit| characters << digit.to_s }
  ('a'..'f').each { |digit| characters << digit }

  uuid = ""
  sections = [8, 4, 4, 4, 12]
  sections.each_with_index do |section, index|
    section.times { uuid += characters.sample }
    uuid += '-' unless index >= sections.size - 1
  end

  uuid
end


