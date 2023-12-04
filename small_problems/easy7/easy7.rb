# combine two lists

# def interleave(arr1, arr2)
#   arr1.zip(arr2).flatten
# end

# p interleave([1, 2, 3], ['a', 'b', 'c']) == [1, 'a', 2, 'b', 3, 'c']

# lettercase counter

# def letter_case_count(str)
#   ltr_case = {lowercase: 0, uppercase: 0, neither: 0}

#   str.each_char do |letter|
#     case letter
#     when ("a".."z") then ltr_case[:lowercase] += 1
#     when ("A".."Z") then ltr_case[:uppercase] += 1
#     else
#       ltr_case[:neither] += 1
#     end
#   end

#   ltr_case
# end


# p letter_case_count('abCdef 123') == { lowercase: 5, uppercase: 1, neither: 4 }
# p letter_case_count('AbCd +Ef') == { lowercase: 3, uppercase: 3, neither: 2 }
# p letter_case_count('123') == { lowercase: 0, uppercase: 0, neither: 3 }
# p letter_case_count('') == { lowercase: 0, uppercase: 0, neither: 0 }


# capitalize words

# def word_cap(str)
#   str.downcase.split(' ').map do |word|
#     word.capitalize
#   end.join(' ')
# end

# p word_cap('four score and seven') == 'Four Score And Seven'
# p word_cap('the javaScript language') == 'The Javascript Language'
# p word_cap('this is a "quoted" word') == 'This Is A "quoted" Word'

# swap case

# def swapcase(str)
#   str.chars.map do |char|
#     case char
#     when ("A".."Z") then char.downcase
#     when ("a".."z") then char.upcase
#     else
#       char
#     end
#   end.join
# end

# p swapcase('CamelCase') == 'cAMELcASE'
# p swapcase('Tonight on XYZ-TV') == 'tONIGHT ON xyz-tv'


# staggered caps (part 1)

# def staggered_case(str)
#   new_str = ''
#   count = 0

#   loop do
#     break if count >= str.size
#     if count.even?
#       new_str << str[count].upcase
#     else
#       new_str << str[count].downcase
#     end
#     count += 1
#   end
#   new_str
# end

# p staggered_case('I Love Launch School!') == 'I LoVe lAuNcH ScHoOl!'
# p staggered_case('ALL_CAPS') == 'AlL_CaPs'
# p staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 NuMbErS'

# staggered caps (part 2)
# ignore non-alphabetic characters 
# charcater should still be included in return value
#    don't count when toggling desired case

# def staggered_case(str)
#   need_upper = true
#   str.chars.map do |char|
#     if char =~ /[a-zA-Z]/
#       if need_upper
#         need_upper = false
#         char.upcase
#       elsif !need_upper
#         need_upper = true
#         char.downcase
#       end
#     else
#       char
#     end
#   end.join
# end

# p staggered_case('I Love Launch School!') == 'I lOvE lAuNcH sChOoL!'
# p staggered_case('ALL CAPS') == 'AlL cApS'
# p staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 nUmBeRs'

# multiplicative average

# def show_multiplicative_average(arr)
#   result = arr.map(&:to_f).reduce(:*) / arr.size
#   format(%(%.3f), result)
# end

# p show_multiplicative_average([3, 5])                # => The result is 7.500
# p show_multiplicative_average([6])                   # => The result is 6.000
# p show_multiplicative_average([2, 5, 7, 11, 13, 17]) # => The result is 28361.667

# multiply lists


# def multiply_list(arr1, arr2)
#   arr1.zip(arr2).map {|pair| pair.reduce(:*) }
# end

# p multiply_list([3, 5, 7], [9, 10, 11]) == [27, 50, 77]


# multiply all pairs


# def multiply_all_pairs(arr1, arr2)
#   arr1.product(arr2).map { |sub_arr| sub_arr.reduce(:*) }.flatten.sort
# end

# p multiply_all_pairs([2, 4], [4, 3, 1, 2]) == [2, 4, 4, 6, 8, 8, 12, 16]


# the end is near but not here

def penultimate(str)
  str.split(' ')[-2]
end

p penultimate('last word') == 'last'
p penultimate('Launch School is great!') == 'is'