# Code outputs: 
# Alice
# Bob

# Code outputs:
# BOB
# BOB

=begin
We initialize local variable `name` to string `Bob` and then we initialize local variable `save_name` to the value referenced by `name`. Both variables point to the same value, When we make a destructive call to `upcase!` on the string object referenced by `name` we are also mutating the same value that `save_name` points to. For this reason the last line outputs string `BOB` twice since we pass two values to method `puts` which both point to the same mutate string value

=end