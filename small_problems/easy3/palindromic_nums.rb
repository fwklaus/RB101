def palindromic_number?(int)
  int.digits.join.to_i == int
end

p palindromic_number?(34543) == true
p palindromic_number?(123210) == false
p palindromic_number?(22) == true
p palindromic_number?(5) == true