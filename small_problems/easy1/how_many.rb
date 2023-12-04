# case senstive
# expected output seems to indicate a hash as our data structure

def count_occurences(obj)
  hsh = {}

  obj.each do |key|
    if hsh.include?(key)
      hsh[key] += 1
    else
      hsh[key] = 1
    end
  end

  hsh.each do |k, v|
    puts "#{k} => #{v}"
  end
end


vehicles = [
  'car', 'car', 'truck', 'car', 'SUV', 'truck',
  'motorcycle', 'motorcycle', 'car', 'truck'
]

count_occurences(vehicles)



# car => 4
# truck => 3
# SUV => 1
# motorcycle => 2