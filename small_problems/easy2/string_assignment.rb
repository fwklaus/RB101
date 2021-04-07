# What does this print out? Can you explain these results?

name = 'Bob'
save_name = name
name.upcase!
puts name, save_name


# => BOB
# => BOB

# explanation: We set the variable stored at name equal to the new variable save_name.
# Save_name now points to the same value as name : Bob.
# We then invoke the upcase method destructively on name, and capitalize the string
# saved to name in place. Because both variables are pointing to the same 
# value, and upcase is invoked destructively, the object in memory is mutated in place.
# The object both variables reference has been set equal to 'BOB'
# Name is now set to "BOB". save_name also points to "BOB"
# puts prints each value on its own line
