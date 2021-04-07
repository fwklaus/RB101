def prompt(str)
  puts ">> #{str}"
end

prompt("Welcome to the loan calculator!")

loop do
  loan_amount = 0
  loop do
    prompt("Please enter the loan amount: ")
    loan_amount = gets.chomp

    if loan_amount.empty? || loan_amount.to_f < 0
      prompt("Please enter a positive loan value:")
    else
      break
    end
  end

  apr = 0
  loop do
    prompt("Please enter the annual APR(%): ")
    apr = gets.chomp

    if apr.empty? || apr.to_f < 0
      prompt("Please enter a positve interest value: ")
    else
      break
    end
  end

  loan_years = 0
  loop do
    prompt("Please enter the loan term, in years: ")
    loan_years = gets.chomp

    if loan_years.empty? || loan_years.to_f < 0
      prompt("Please enter a positive loan term value: ")
    else
      break
    end
  end

  annual_apr = apr.to_f / 100
  monthly_rate = annual_apr / 12
  loan_months = loan_years.to_i * 12

  monthly_payment = loan_amount.to_f * (monthly_rate /
                    (1 - (1 + monthly_rate)**(-loan_months.to_i)))

  result = <<OUTPUT
  At a monthly rate of #{(monthly_rate * 100).round(2)}%, it will take #{loan_months}
  payments at $#{format('%.2f', monthly_payment)} to pay off your loan.
OUTPUT

  prompt(result)

  prompt("Would you like to calculate another loan?")
  answer = gets.chomp

  break unless answer.downcase.match('y')
end

prompt("Thanks for using the loan calculator! Goodbye...")
