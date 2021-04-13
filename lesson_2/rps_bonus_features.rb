VALID_CHOICES = %w(rock paper scissors lizard spock)
round = 0
grandwinner = ''
player_tally = '0'
computer_tally = '0'
quit = false

def prompt(message)
  puts(">> #{message}")
end

def output_spaces(spaces)
  spaces.times { |_| puts }
end

WIN = {  'rock': ['scissors', 'lizard'],
         'paper': ['rock', 'spock'],
         'scissors': ['paper', 'lizard'],
         'lizard': ['spock', 'paper'],
         'spock': ['rock', 'scissors'] }

def first_character(choice)
  case choice
  when 'r' then 'rock'
  when 'p' then 'paper'
  when 'l' then 'lizard'
  when 'sp'then 'spock'
  when 'sc'then 'scissors'
  end
end

def display_results(player, computer)
  if WIN.fetch(player.to_sym).include?(computer)
    prompt("You won the round!")
  elsif WIN.fetch(computer.to_sym).include?(player)
    prompt("Computer won the round!")
  else
    prompt("It's a tie!")
  end
end

def tally_round(player_choice, computer_choice, player_score, computer_score)
  if WIN.fetch(player_choice.to_sym).include?(computer_choice)
    player_score << "1"
  elsif WIN.fetch(computer_choice.to_sym).include?(player_choice)
    computer_score << "1"
  end
end

def display_score(player, computer)
  message = <<~MSG
    >> Player score: #{player.split(//).map(&:to_i).reduce(:+)} 
    >> Computer score: #{computer.split(//).map(&:to_i).reduce(:+)}
  MSG
  puts message
end

loop do
  system("clear")
  prompt("Welcome to Rock Paper Scissors Spock Lizard!")
  output_spaces(1)
  loop do
    round += 1
    choice = ''
    prompt("Round #{round}...")
    display_score(player_tally, computer_tally)

    loop do
      prompt("Choose one: #{VALID_CHOICES.join(',  ')}. (Enter 'exit' to quit)")
      choice = gets.chomp.downcase
      output_spaces(1)

      if VALID_CHOICES.include?(first_character(choice))
        choice = first_character(choice)
        break
      elsif choice.start_with?('s')
        prompt("Please enter 'sp' for spock, or 'sc' for scissors.")
      elsif choice == 'exit'.downcase
        quit = true
        prompt("Quitting...")
        sleep(2)
        break
      else
        prompt("That's not a valid choice.")
      end
    end

    if quit == true
      break
    else
      computer_choice = VALID_CHOICES.sample

      prompt("You threw #{choice}; Computer threw #{computer_choice}")

      display_results(choice, computer_choice)
      tally_round(choice, computer_choice, player_tally, computer_tally)

      if computer_tally.split(//).map(&:to_i).reduce(:+) == 5
        grandwinner = "Computer"
        break
      elsif player_tally.split(//).map(&:to_i).reduce(:+) == 5
        grandwinner = "Player"
        break
      end
      output_spaces(2)
    end
    sleep(3)
  end

  if quit == true
    break
  else
    prompt("#{grandwinner} wins the game! Thank you for playing.")

    prompt("Do you want to play again? First to 5 wins!")
    play_again = gets.chomp
    if play_again.downcase.start_with?('y')
      player_tally = '0'
      computer_tally = '0'
    else
      break
    end
  end
end

prompt("Good bye!")
