# Practice Problems:

=begin

#1) [1,2,3] - will return the original array. Select evaluates the last 
    expression of the block to determine the blocks return value. "Hi" is
    always "truthy", so all of the elements will be selected
    
#2) For an invocation of count with no argument given and a block, count 
    "returns the count of elements for which the block returns a truthy value".
     This answer was found in the Ruby API under Array#count

#3) Array#reject returns a new array of elements from the caller for which the 
    block evaluates to false or nil
    [1,2,3] - In the example, the the last expression is 'puts num'. Puts always
    evaluates to nil, so on each iteration the element evaulates to nil. The
    original array is returned

#4) hash = {'a' => 'ant', 'b' => 'bear', 'c' => 'cat'} - The block parameter (value)
    represents the current value of the calling array on each iteration, and hash represents
    the hash object we initialize with the argument. On each iteration we reference
    the first element of the string stored at value with the string element reference operator and set
    the first letter from value as the key, and then assign the value of value
    as the value of the key.

#5) According to the documentation, hash#shift destructively removes the first hash entry(according
    to entry order), and returns the removed key-value pair as a two element 
    array
    
    [:a, 'ant']
    
#6) Pop destructively removes the last element of the array and returns the value. 
    Chaining size on pop, size evaluates the length of the returned string value,
    'caterpillar', and returns 11.

#7) The block evaluates the last expression and returns true if the block returns
    any truthy value. If the block ever returns a value other than false or nil,
    the method returns true. The method returns true. The method invokes puts num (the
    array element passed in at each iteration) only once. The method stops
    iterating after the first iteration as the first invocation of the block evaluates to true
    
#8) Array#returns a new array(non-destructive) containing the specified number
    of elements from the array. arr.take(2) will return [1,2]
    
#9) Map performs transformation on each iteration. Here, it is called on a hash.
    It invokes a block and takes two parameters. The if condition in the block 
    checks the size of the value, and returns the value if the size is greater than 3. 
    It returns an array - [nil, 'bear']. Map evaluates the last expression, and 
    based on that it transforms the value. 'ant' is less than 3 so the condition
    evaluates to false, and the if statement returns nothing (nil). 'bear' is greater than 3,
    so the condition evaluates to true and the if statement returns value.

#10) [1, nil, nil] - map transforms based on the last expression of the block.
     On the first iteration num == 1, so the if statement returns num. On the 
     second and third iterations num is greater than 1, so the method outputs num,
     but the if statement itself returns nil, as 'puts' always returns nil, so 
     those values are transformed accordingly to 'nil'.

=end



