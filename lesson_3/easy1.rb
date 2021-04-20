# 1) What would you expect the code below to print out?

# numbers = [1, 2, 2, 3]
# numbers.uniq

# puts numbers

=begin
Expect numbers to output [1,2,2,3], the original array. While .uniq is called
on numbers, returning an array of unique values, removing the duplicate 2, it 
does so non-destructively, so the original array isn't mutated.
The return value from the invocation is never saved to a variable, either. When 
numbers is passed to puts, puts outputs the original array from line 3
with each number on its own line converted to string
=end

#_______________________________________________________________________________
# 2) Describe the difference between ! and ? in Ruby. And explain what would
#    happen in the following scenarios:

=begin
    what is != and where should you use it?
    put ! before something, like !user_name
    put ! after something, like words.uniq!
    put ? before something
    put ? after something
    put !! before something, like !!user_name
=end

=begin
! is the bang suffix. It usually suggests a destructive operation when appended
to the end of a method name. It also stands for "not" in the not equal (!=)
comparison operator. Also, two exclamation points can be used before an 
expression wrapped in parentheses to force the expression to evaluate to a 
boolean. 

? is added to the end of method names to suggest a boolean return value. It is
also used for the ternary conditional operation, placed after the expression
to be evaluated. 

!= - The not equal comparison operator. Used to compare values and check whether
     values are not equal. Will return true if operands are not equal, rather
     than false in an == comparison
     
! - as a prefix to a variable, the "not" inverts the evaluation of the value.
    If a = true, !a == false; and if a = false, !a == true. 

! - placed after something, the exclamation point is the bang suffix. It suggests
    a destructive operation, that is, the method with will mutate the caller
    
? - as a prefix, such as ?f, the question mark will return a string representation
    of the character it's bound to
    
? - the question mark after a method suggests the method will return a boolean.
    Also, it's used in the ternary conditional operation after the evaluated
    expression
    
!! - before something, the double exclamation point will force the evaluation
     of an expression or a value to a boolean
=end

#_______________________________________________________________________________
# 3) Replace the word "important" with "urgent" in this string:

# advice = "Few things in life are as important as house training your pet dinosaur."

# def replace(str)
#   str.split.map{|word| word == 'important' ? word = 'urgent' : word}.join(' ')
# end

# p replace(advice)

#____launch_solution______________________
# omg, I need to look for the simplest solution

# advice.gsub!('important', 'urgent')
# p advice

#_______________________________________________________________________________
# 4) The Ruby Array class has several methods for removing items from the array.
#    Two of them have very similar names. Let's see how they differ:

# numbers = [1, 2, 3, 4, 5]

# numbers.delete_at(1)
# Will delete the value at index 1. 2 will be deleted. Returns deleted index value 
# mutates the array

# numbers.delete(1)
# Will delete the first instance of the value 1. Will return the deleted value
# mutates the array

#_______________________________________________________________________________
# 5) Programmatically determine if 42 lies between 10 and 100.

# 42.between?(10, 100)
 
#_________________or_______________________________

# (10..100).include?(42)

#______________launch_solution___________________________

# (10..100).cover?(42)

#_______________________________________________________________________________
# 6) Show two different ways to put the expected "Four score and " in front of 
#    the following string

# famous_words = "seven years ago..."

# 1)
# famous_words.split.unshift("Four score and").join(' ')

# 2)
# famous_prefix = "Four score and "
# famous_prefix << famous_words

# 3)
# "Four score and " + famous_words 

#_______________________________________________________________________________
# 7)

# flintstones = ["Fred", "Wilma"]
# flintstones << ["Barney", "Betty"]
# flintstones << ["BamBam", "Pebbles"]

# one_dimensional_array = flintstones.flatten
# flintstones.flatten!

#_______________________________________________________________________________
# 8)  Turn this into an array containing only two elements: Barney's name and
#     Barney's number

flintstones = { "Fred" => 0, "Wilma" => 1, "Barney" => 2, "Betty" => 3, "BamBam" => 4, "Pebbles" => 5 }

flintstones = flintstones.to_a[2]
p flintstones

#__launch_solution_______________________

flintstones.assoc("Barney")
#=> ["Barney", 2]
