# Input: integer(number of switches)
# Output: array(which lights are on)

# Rules
#  -Explicit:
#     -method takes one argument - n number of switches
#     -returns array -list of lights on after n repetitions
#     -each switch is connnected to 1 light - initially off
#

#  -Implicit:
#    - each round, intiial toggle integer increments by one
#          - toggle from current number by current number up to and including n

## example - 5
# round 1: toggle all switches on  (on: 1,2,3,4,5)(off:)
# round 2: toggle 2(n) -  toggle 2 (on: 1,3,5)    (off:2,4)
# round 3: toggle 3(n) -  toggle 3 (on: 1,5)      (off:2,3,4)
# round 4: toggle 4(n) -  toggle 4 (on: 1,4,5)    (off:2,3)
# round 5: toggle 5(n) -  toggle 5 (on:1,4)       (off:2,3,5)

## example 10
# round 1: toggle all switches on  (on: 1,2,3,4,5,6,7,8,9,10) (off:)
# round 2: toggle 2(n) -  toggle 2 (on:1,3,5,7,9)             (off:2,4,6,8,10)
# round 3: toggle 3(n) -  toggle 3 (on:1,5,6,7)               (off:2,3,4,8,9,10)
# round 4: toggle 4(n) -  toggle 4 (on:1,4,5,6,7,8)           (off:2,3,9,10) 
# round 5: toggle 5(n) -  toggle 5 (on:1,4,6,7,8,10)          (off:2,3,5,9)
# round 6: toggle 6(n) -  toggle 6 (on:1,4,7,8,10)            (off:2,3,5,6,9)
# round 7: toggle 7(n) -  toggle 7 (on:1,4,8,10)              (off:2,3,5,6,7,9)
# round 8: toggle 8(n) -  toggle 8 (on:1,4,10)                (off:2,3,4,6,7,8,9)
# round 9: toggle 9(n) -  toggle 9 (on:1,4,9,10 )             (off:2,3,4,6,7,8)
# round 10:toggle 10(n) - toggle 10 (on:1,4,9)                (off:2,3,4,6,7,8,10)


## DataStrcutures/Algorithm:
#  take integer-number of switches
#  create a hash to store state of each switch ({}) 
#      set all switches off by default 
#      array to store values (on:[], off:[])
#  first round call method to set all lights to on position (if, empty?)

## lights_on algorithm
# if on is empty, populate array with values from 1 to n (upto)
# return hash
###

# need count variable to increment so terminating condition is met
# repeatedly call flip_switches, passing in count as start value (upto)

###flip switch algorithm
# take three args - start_value(count), stop_value(n), hsh
# iterate over range (step)
#   steps through range from start_value to stop_value
#   check if current value is set to on or off (if)
#            if value is on, delete from on and set to off (<<, delete)
#            if value is off, delete from off and set to on ( << ,delete)
#   return hash
###

# reassign state hsh to return value of flip_switches
# increment current number
# return array of lights in on position

def lights_on(n,hsh)
  1.upto(n) { |num| hsh[:on] << num }
  hsh
end

def flip_switches(start_value, stop_value, hsh)
 start_value.step(by:start_value, to:stop_value) do |i|
   if hsh[:on].include?(i)
     hsh[:off] << hsh[:on].delete(i)
   else
     hsh[:on] << hsh[:off].delete(i)
   end
 end
 hsh
end


def toggle_lights(n)
  state = {on: [], off: []}
  current_round = 1 
  
  if state[:on].empty?
    state = lights_on(n,state)
    current_round += 1
  end
  
  current_round.upto(n) do |i|
  state = flip_switches(i, n, state)

   current_round += 1
  end
  state.values[0]
end 
  
p toggle_lights(5)
p toggle_lights(10)
p toggle_lights(1000)

=begin

#_launch_solution

# initialize the lights hash
def initialize_lights(number_of_lights)
  lights = Hash.new
  1.upto(number_of_lights) { |number| lights[number] = "off" }
  lights
end

# return list of light numbers that are on
def on_lights(lights)
  lights.select { |_position, state| state == "on" }.keys
end

# toggle every nth light in lights hash
def toggle_every_nth_light(lights, nth)
  lights.each do |position, state|
    if position % nth == 0
      lights[position] = (state == "off") ? "on" : "off"
    end
  end
end

# Run entire program for number of lights
def toggle_lights(number_of_lights)
  lights = initialize_lights(number_of_lights)
  1.upto(lights.size) do |iteration_number|
    toggle_every_nth_light(lights, iteration_number)
  end

  on_lights(lights)
end

p toggle_lights(1000)

=end