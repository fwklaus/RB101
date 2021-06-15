# Input: string(sentence)
# Output: string(string word digits returned as string digits )

# Rules:
#   -Explicit:
#       - takes string as input
#       - returns same string
#            - string words converted to string digits
#            
#   -implicit:
#       -case-insensitive?


## DataStructure/Algorithms
# - initialize number hash
# - take string
# - split string to array
# - iterate over string array (each)
# - substitute element with associated value


NUMBER = {"zero" => "0",
          "one"  => "1",
          "two"  => "2",
          "three"=> "3",
          "four" => "4",
          "five" => "5",
          "six"  => "6",
          "seven"=> "7",
          "eight"=> "8",
          "nine" => "9"
}

def word_to_digit(str)
    result = []
    
    str.split.each do |el|
      if NUMBER.include?(el)
        result << NUMBER[el]
      else 
        result << el
      end
    end
    
    NUMBER.keys.each do |key|
      result.each do |el|
        if /#{key}/ =~ el 
          el.gsub!(/#{key}/, NUMBER[key])
        end
      end
    end
    
    result.join(' ')
end
  

p word_to_digit('Please call me at five five five one two three four. Thanks.') == 'Please call me at 5 5 5 1 2 3 4. Thanks.'


# launch_solution

DIGIT_HASH = {
  'zero' => '0', 'one' => '1', 'two' => '2', 'three' => '3', 'four' => '4',
  'five' => '5', 'six' => '6', 'seven' => '7', 'eight' => '8', 'nine' => '9'
}.freeze

def word_to_digit(words)
  DIGIT_HASH.keys.each do |word|
    words.gsub!(/\b#{word}\b/, DIGIT_HASH[word])
  end
  words
end