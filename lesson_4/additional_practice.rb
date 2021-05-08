# Practice Problems:
=begin
# 1) 

flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]

_________________________________________________________________
hash = flintstones.each_with_object({}) do |key , hash|
    hash[key] = flintstones.index(key)
  end

______________________________________________________________
hash = {}

flintstones.each_with_index do |ele,index|
  hash[ele] = index
end
__________________________________________________________

# 2) 

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }

ages.values.sum

ages.values.reduce(&:+)

obj = 0
ages.each{|_,value| obj += value}

p obj


# 3)

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }

ages.delete_if{ |_,value| value >= 100 }

new_ages = {}

ages.each do |key,value| 
  if value >= 100
    next
  else
    new_ages[key] = value
  end
end

# 4)

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }

ages.values.min

min = ages.values.max 
ages.each do |_, value|
  min = value if value < min
end


# 5)
  
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

flintstones.each do |ele| 
  if ele.start_with?("Be")
    puts "#{ele}: at index #{flintstones.index(ele)}"
    break
  end
end
  
#_launch_solution__

flintstones.index { |name| name[0, 2] == "Be" }


# 6)

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

flintstones.map!{ |ele| ele.slice(0,3)}

flintstones.map!{ |ele| ele[0,3]}

# 7)

statement = "The Flintstones Rock"

frequency = {}

statement.chars.each do |key|
  if key.match?(/[a-z]/i)
    if frequency.has_key?(key) 
      frequency[key] += 1
    else
      frequency[key] = 1
    end
  end
end

#_launch_solution___

result = {}
letters = ('A'..'Z').to_a + ('a'..'z').to_a
letters.each do |letter|
  letter_frequency = statement.scan(letter).count
  result[letter] = letter_frequency if letter_frequency > 0
end

# 8)

On the first iteration, the method would output number 1. The first element(1)
would then be removed by shift. The 1st index position would then point to 3.
The next iteration would output 3. Then the four would be removed. The iteration would
then end, so the output is 1, then 3. Numbers itself, having had shift called on it twice, will
return [3,4]

On the first iteration 1 is output. Then pop is invoked on numbers with 
1 passed in, removing the last number. On the second iteration 2 is output, and
pop is called again, removing the 3 from the array. After that the iteation should end.
Output is 1, and 2. The return value of numbers is [1,2]

# 9) 

words = "the flintstones rock"

words.split(' ').map{ |word| word.capitalize }.join(' ')

=end

# 10) 

# Input: hash
# Output: hash(extra key-value pair for each nested hash)

#  modify the hash destructively

# Data Structures/Algorithm
# -Iterate over munsters keys
#      - evaluate age key of nested hash
#      - if age is in kid range
#            -set "age_group" equal to value returned by helper method
#      - else age is in adult range ...
#      - end
# 

KID_RANGE = (0..17)
ADULT_RANGE = (18..64)
SENIOR_RANGE = (65..)

# age group helper method

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

def age_group(range)
  case range
  when 0..17  then 'kid'
  when 18..64 then 'adult'
  when 65..   then 'senior'
  end
end

munsters.keys.each do |key|
  if KID_RANGE.cover?(munsters[key]["age"])
    munsters[key]["age_group"] = age_group(munsters[key]["age"])
  elsif ADULT_RANGE.cover?(munsters[key]["age"])
    munsters[key]["age_group"] = age_group(munsters[key]["age"])
  else
    munsters[key]["age_group"] = age_group(munsters[key]["age"])
  end
end

p munsters


#_launch_solution_____

munsters.each do |name, details|
  case details["age"]
  when 0...18
    details["age_group"] = "kid"
  when 18...65
    details["age_group"] = "adult"
  else
    details["age_group"] = "senior"
  end
end
