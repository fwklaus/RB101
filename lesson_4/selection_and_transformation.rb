# input: hash
# output: new hash

# Rules:
#   -Explicit:
#     - takes a hash
#     - returns hash 
#           - only returns key-value pairs with a value of 'Fruit'

# Data Structure/Algorithms
#   -loop
#   -hash
#   -arrays

#   - initialize index variable
#   - initialize empty hash
#   - store produce keys in an array variable
#   - loop
#      - store value from array referenced by index in current_produce variable
#      - store value from hash referenced by current produce in produce_type variable
#      - select produce_types equal to 'Fruit'
#      - break if index is equal to hsh.keys.size
#   - end loop
#   - return new hash

def select_fruit(hsh)
  index = 0
  new_hsh = {}
  items = hsh.keys
  loop do
    break if index == hsh.keys.size
    current_produce = items[index]
    produce_type = hsh[current_produce]
    new_hsh[current_produce] = produce_type if produce_type == 'Fruit'
    index += 1
  end
  new_hsh
end

produce = {
  'apple' => 'Fruit',
  'carrot' => 'Vegetable',
  'pear' => 'Fruit',
  'broccoli' => 'Vegetable'
}


p select_fruit(produce) # => {"apple"=>"Fruit", "pear"=>"Fruit"}

#_launch_solution___

def select_fruit(produce_list)
  produce_keys = produce_list.keys
  counter = 0
  selected_fruits = {}

  loop do
    # this has to be at the top in case produce_list is empty hash
    break if counter == produce_keys.size

    current_key = produce_keys[counter]
    current_value = produce_list[current_key]

    if current_value == 'Fruit'
      selected_fruits[current_key] = current_value
    end

    counter += 1
  end

  selected_fruits
end