require "pry"
=begin
PROBLEM: takes n switches, returns an array identifying which
switches are on after n repetitions

input: integer
output: array
mutating?: no

rules:
   -explicit:
     - takes n switches
         - 1 to n switches are initially off
         - on the first turn you toggle the lights on
         - on each subsequent pass you toggle mulitples of the current round
           - repeat the process until you've been through n repetitions
     - return array identifying lights on after n repetitions
    
   -implicit:
     
unclear parts of problem?:

examples/test_cases:
round 1: every light is turned on
round 2: lights 2 and 4 are now off; 1, 3, 5 are on
round 3: lights 2, 3, and 4 are now off; 1 and 5 are on
round 4: lights 2 and 3 are now off; 1, 4, and 5 are on
round 5: lights 2, 3, and 5 are now off; 1 and 4 are on


data/alg:
 - take n lights
    -initiially lights are off
      - creat a hash with two keys - :on and :off
      - for the first round
        - from 1 to n
          - put all lights to the on position
      - for the second round
        - from 2 to n
          - toggle the lights that are multiples of current round
=end


def toggle_lights(n, round, lights)
  round.step(by:round, to:n) do |i|
    if lights[:on].include?(i)
      lights[:off] << lights[:on].delete(i)
    else
      lights[:on] << lights[:off].delete(i)
    end
  end
end

def initialize_lights(n)
  lights = {on: [], off: []}

  (1..n).each do |num|
    lights[:on] << num
  end

  lights
end

def thousand_lights(n)
  lights = initialize_lights(n)

  2.upto(n) do |round|
    toggle_lights(n, round, lights)
  end
  
  lights[:on]
end

p thousand_lights(5) == [1, 4]
p thousand_lights(10) == [1, 4, 9]