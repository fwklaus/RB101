# Input: string
# Output: integer(register value)


# list of commands:
#  n    - place a value n in the "register". Do not modify the stack
#  PUSH - push a register value on to the stack. Leave the value in the register
#  ADD  - pops a value from the stack and adds it to the register value, storing the result in the register
#  SUB  - pops a value from the stack and subtracts it from the register value, "
#  MULT - pops a value from the stack and multiplies it by the register value, "
#  DIV  - pops a value from the stack and divides it into the register value, storing the integer result in the register
#  MOD  - pops a value from the stack and divides it into the register value, storing the integer remainder of the division in the register.
#  POP  - removes the topmost item from the stack and place it in the register
#  PRINT- print the register value

# Rules:
#   -Explicit:
#      -each operation in the language operates on a register
#      -programs supplied via string argument
#      -implement stack-and-register based prograqmming language
#               -has the above commands
#      -all operations are integer operations
#      -assume all programs are correct programs
#                -won't try to pop a non-existent value, or contain unknown tokens
#      -initialize the register to 0



## DataStructures/Algorithm:
# - split program arument to arr (split)
# - initialize register to 0
# - initialize empty stack array

## loop algorithm:
# -iterate over program array (each)
# -perform check on each element of array (case statement)
#      -perform required operation for each command
#      -when element is PUSH, take the following value and add it to the register
# 


def execute_program(program, register = 0, stack = [])

  program.each do |el|  
    case 
    when el.to_i.to_s == el                             # n: assignment
      register = el.to_i                                
    when el == "PUSH"                                   #"PUSH"
      stack.push(register)
    when el == "ADD"                                    #  "ADD"
      register += stack.pop
    when el == "SUB"                                   #  "SUB"
       register -= stack.pop
    when el == "MULT"                                  #  "MULT"
       register *= stack.pop 
    when el == "DIV"                                   #  "DIV"
       register /= stack.pop
    when el == "MOD"                                   #  "MOD"
       register %= stack.pop
    when el == "POP"                                   #  "POP"
       register = stack.pop
    when el == "PRINT"                                 #  "PRINT"
       puts register
    end
  end
  
end


def minilang(program)
  program_arr = program.split
  execute_program(program_arr)
end


minilang('PRINT')
# 0

minilang('5 PUSH 3 MULT PRINT')
# -> register:5 stack:[]
# -> register:5 stack:[5]
# -> register:3 stack: [5]
# -> register: 15 stack: []
# -> 15

minilang('5 PRINT PUSH 3 PRINT ADD PRINT')
# 5
# 3
# 8

minilang('5 PUSH POP PRINT')
# 5

minilang('3 PUSH 4 PUSH 5 PUSH PRINT ADD PRINT POP PRINT ADD PRINT')
# -> register: 3
# -> register: 3, stack: [3]
# -> register: 4, stack: [3]
# -> register: 4, stack: [3,4]
# -> register: 5, stack: [3,4,5]
# -> 5
# -> register: 10, stack: [3,4]
# -> 10
# -> register: 4, stack: [3]
# -> 4
# -> register: 7, stack []
# -> 7

# 5
# 10
# 4
# 7

minilang('3 PUSH PUSH 7 DIV MULT PRINT ')
# 6

minilang('4 PUSH PUSH 7 MOD MULT PRINT ')
# 12

minilang('-3 PUSH 5 SUB PRINT')
# 8

minilang('6 PUSH')
# (nothing printed; no PRINT commands)
