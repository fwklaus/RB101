def halvsies(arr)
  first_half = []
  second_half = []
  middle = (arr.size.to_f / 2).ceil

  first_half = arr[...middle]
  second_half = arr[middle..]
  
  [first_half, second_half]
end

p halvsies([1, 2, 3, 4]) == [[1, 2], [3, 4]]
p halvsies([1, 5, 2, 4, 3]) == [[1, 5, 2], [4, 3]]
p halvsies([5]) == [[5], []]
p halvsies([]) == [[], []]