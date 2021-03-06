# ask the user for two numbers
# ask the user for an operation to perform
# perform the operation on the two numbers
# output the result
require 'yaml'
MESSAGES = YAML.load_file('calculator_messages.yml')

def messages(message, lang = 'en')
  MESSAGES[lang][message]
end

def prompt(message)
  puts "=> #{message}"
end

def integer?(num)
  num.to_i.to_s == num
end

def float?(num)
  num.to_f.to_s == num
end

def number?(num)
  integer?(num) || float?(num)
end

def operation_to_message(op)
  message = case op
            when '1'
              'Adding'
            when '2'
              'Subtracting'
            when '3'
              'Multiplying'
            when '4'
              'Dividing'
            end
    return message
end

prompt(messages("welcome", "es"))

name = ''
loop do
  name = gets.chomp

  if name.empty?
    prompt(messages("valid_name", "en"))
  else
    break
  end
end

prompt("Hi #{name}")

loop do # main loop
  number1 = ''
  loop do
    prompt(messages("first_num", "en"))
    number1 = gets.chomp

    if integer?(number1)
      break
    else
      prompt(messages("invalid_number", "en"))
    end
  end

  number2 = ''
  loop do
    prompt(messages("second_num", "en"))
    number2 = gets.chomp

    if integer?(number2)
      break
    else
      prompt(messages("second_num", "en"))
    end
  end

  operator_prompt = <<-MSG
    What operation would you like to perform?
    1) add
    2) subtract
    3) multiply
    4) divide
  MSG

  prompt(operator_prompt)

  operator = ''
  loop do
    operator = gets.chomp

    if %w(1 2 3 4).include?(operator)
      break
    else
      prompt(messages("invlaid_op", "es"))
    end
  end

  prompt("#{operation_to_message(operator)} the two numbers...")

  result = case operator
           when '1'
             number1.to_i + number2.to_i
           when '2'
             number1.to_i - number2.to_i
           when '3'
             number1.to_i * number2.to_i
           when '4'
             number1.to_f / number2.to_f
           end

  prompt("The result is #{result}")
  prompt(messages("another_op?", "es"))
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt(messages("good_bye", "es"))


