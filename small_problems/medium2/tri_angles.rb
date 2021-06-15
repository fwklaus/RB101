# input: 3 integers(angles of a striangle)
# output: symbol(triangle type)

# rules:
#   -explicit:
#       - takes 3 angles of a triangles 
#       - returns symbol
#             -triangle:
#                 -right - One angle of the triangle is a right angle (90 degrees)
#                 -acute - All 3 angles of the triangle are less than 90 degrees
#                 -obtuse - One angle is greater than 90 degrees.
#                 -invalid 
#       - valid triangle:
#             -sum of the angles must be exactly 180 degrees
#             -all angles must be greater than 0
#       -assume integer angle values
#       -assume arguments are degree values

### DataStructures/Algorithm:
# -all?
# - sum
# - any?
# - count
#
## validate triangle:
#   - check if all angles are greater than 0
#   - check if sum of angles is exactly 180 degrees
#
## get type:
#  - if one angle is 90 degrees - count
#       - return right 
#  - if all 3 angles are less than 90 degrees - all?
#       - return acute 
#  - if an angle is greater than 90 degrees - any?
#       - return obtuse

def is_valid?(tri_arr)
  if tri_arr.all? { |angle| angle > 0} 
      return true if tri_arr.sum == 180
  end
  false
end

def get_type(tri_arr)
  
  if tri_arr.count(90) == 1
    :right
  elsif tri_arr.all?{ |angle| angle < 90}
    :acute  
  elsif tri_arr.any?{ |angle| angle > 90 }
    :obtuse
  end
  
end

def triangle(angle_1, angle_2, angle_3)
  triangle = [angle_1, angle_2, angle_3]
  
  if is_valid?(triangle)
    return get_type(triangle)
  else 
    return :invalid
  end

end





p triangle(60, 70, 50) == :acute
p triangle(30, 90, 60) == :right
p triangle(120, 50, 10) == :obtuse
p triangle(0, 90, 90) == :invalid
p triangle(50, 50, 50) == :invalid


# launch_solution_

def triangle(angle1, angle2, angle3)
  angles = [angle1, angle2, angle3]

  case
  when angles.reduce(:+) != 180, angles.include?(0)
    :invalid
  when angles.include?(90)
    :right
  when angles.all? { |angle| angle < 90 }
    :acute
  else
    :obtuse
  end
end