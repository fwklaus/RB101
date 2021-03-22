# Locate the ruby documentation for methods File::path and File#path. How are
# they different?

# File::path is a class method. Returns a string representation of the path.  
# Called on the class
# path(path) ---> string

# File#path is an instance method. Returns the pathname used to create file
# as a string. Does not normalize the name.
# Called on objects - instances of a class
# path ---> filename
