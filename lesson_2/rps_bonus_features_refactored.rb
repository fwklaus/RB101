VALID_CHOICES = %w(rock(r) paper(p) scissors(sc) lizard(l) spock(sp))
WINNING_SCORE = 5
round = 0
grandwinner = ''
score = { "player" => '0',
          "computer" => '0' }

def prompt(message)
  puts(">> #{message}")
end

def output_spaces(spaces)
  spaces.times { |_| puts }
end

WELCOME_MESSAGE = <<~MSG
>> Welcome to the Rock-Paper-Scissors-Spock-Lizard game!
        - Each round, select either rock, paper, scissors, spock, or lizard
        - Test your wits against the computer
        - First to 5 wins the game! Good luck!
MSG

WINNING_COMBOS = { 'rock': ['scissors', 'lizard'],
                   'paper': ['rock', 'spock'],
                   'scissors': ['paper', 'lizard'],
                   'lizard': ['spock', 'paper'],
                   'spock': ['rock', 'scissors'] }

VALID_FIRST_CHARACTER = { 'r': 'rock',
                          'p': 'paper',
                          'l': 'lizard',
                          'sp': 'spock',
                          'sc': 'scissors' }

def valid_move?(choice)
  if VALID_FIRST_CHARACTER.include?(choice)
    choice
  else
    prompt("That's not a valid choice.")
  end
end

def win?(player, computer)
  WINNING_COMBOS.fetch(player.to_sym).include?(computer)
end

def display_results(player, computer)
  if win?(player, computer) == true
    prompt("You won the round!")
  elsif win?(player, computer) == false
    prompt("Computer won the round!")
  else
    prompt("It's a tie!")
  end
end

def tally_round(player_choice, computer_choice, player_score, computer_score)
  if win?(player_choice, computer_choice) == true
    player_score << '1'
  elsif win?(player_choice, computer_choice) == false
    computer_score << '1'
  end
end

def determine_winner(player_score, computer_score)
  if computer_score.split(//).map(&:to_i).reduce(:+) == WINNING_SCORE
    "Computer"
  elsif player_score.split(//).map(&:to_i).reduce(:+) == WINNING_SCORE
    "Player"
  else
    ''
  end
end

def display_score(player, computer)
  message = <<~MSG
    >> Player score: #{player.split(//).map(&:to_i).reduce(:+)} 
    >> Computer score: #{computer.split(//).map(&:to_i).reduce(:+)}
  MSG
  puts message
end

def play_again?
  prompt("Do you want to play again? First to 5 wins!")
  play_again = gets.chomp
  play_again.downcase.start_with?('y')
end

def victory_message(winner)
  25.times do |_|
    print '!'
    sleep(0.25)
  end
  prompt("#{winner} wins the game! Thank you for playing.")
end

loop do
  system("clear")
  round = 0
  score['player'] = '0'
  score['computer'] = '0'
  puts WELCOME_MESSAGE
  output_spaces(1)

  loop do
    round += 1
    choice = ''
    prompt("Round #{round}...")
    display_score(score['player'], score['computer'])

    loop do
      prompt("Choose one: #{VALID_CHOICES.join(',  ')}")
      choice = gets.chomp.downcase.to_sym
      output_spaces(1)

      if valid_move?(choice)
        choice = VALID_FIRST_CHARACTER.fetch(choice)
        break
      end
    end

    computer_choice = VALID_FIRST_CHARACTER.values.sample

    prompt("You threw #{choice}; Computer threw #{computer_choice}")
    display_results(choice, computer_choice)
    tally_round(choice, computer_choice, score['player'], score['computer'])

    grandwinner = determine_winner(score['player'], score['computer'])
    break if grandwinner == 'Computer' || grandwinner == 'Player'

    output_spaces(2)
    sleep(3)
  end

  victory_message(grandwinner)
  display_score(score['player'], score['computer'])

  play_again? ? output_spaces(2) : break
end

prompt("Good bye!")
