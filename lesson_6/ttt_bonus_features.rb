require "pry-byebug"
# Tic Tac Toe

# 1) Improved 'join'
=begin

# input: array, delimeter, conjunction
# output: interpolated string

# rules:
#   -implicit: 
#       -default to "or" for conjunction
#       -default to ',' for delimiter

## DataStructures/Algorithm:
# -create an empty string
# -iterate over given array
# -check if element is the last in the array
#   -if it is
#       -append conjunction, space, element to string
#   -otherwise
#       -append element, delimiter, space to string

def joinor(square_arr, delim = ',', conjunction = 'or')
  available_squares = ''
  square_arr.each do |square|
    if square == square_arr.last
      available_squares << "#{conjunction} #{square}"
    elsif square_arr.size <= 2
      delim = ''
      available_squares << "#{square}#{delim} "   
    else
      available_squares << "#{square}#{delim} "   
    end
  end
  available_squares
end

# p joinor([1, 2])                   # => "1 or 2"
# p joinor([1, 2, 3])                # => "1, 2, or 3"
# p joinor([1, 2, 3], '; ')          # => "1; 2; or 3"
# p joinor([1, 2, 3], ', ', 'and')   # => "1, 2, and 3"

# 2) Keep score

# input: boolean(player/computer wins)
# output: integer(tally)

# rules:
#  explicit: 
#     -don't use global or instance variables
#     -first player to 5 wins

# DataStructures/Algorithm
# detect_winner
# someone_won

# intialize variables to store player tally, and computer tally
# if someone won and detect winner returns player
#    -increment tally for player
# if  someone won and detect winner returns computer
#    -increment tally for computer
# break out of game if either player reaches 5

## increment score algorithm:
# - ternary conditional statement


scores = {player: 0, computer: 0}


def increment_score(winner,scores)
  winner == "Player" ? scores[winner] += 1 : scored[winner] += 1
end

=end

# 3) Computer AI: Defense

# rules:
#   -explicit: 
#      -"immediate threat" = 2 squares marked by the opponent in a row
#      - if no immediate threat, computer will pick at random
#   -implicit:
#      - two occupied squares in line are not considered immediate threat
#        if not consecutive


# 4) Computer AI: Offense
# input: array
# output: integer

# rules:
#   -explicit:
#       -if computer already has 2 "O's" in a row place an O on third square
#       
# determine if line has two computer markers 
# if line has two O's determine the open square
# set the O on the open square

# 5) Computer turn refinements

# when computer goes first, the "O" is not disaplyed until after player move
# 5 is not an available option while the "O" is not visible 


# 6) improve the game loop

# generic method
# knows how to place the piece depending on the current player

# input: integer (current player)
# output: integer(value of next player's turn)





#_______________________________________________________________________##________
WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # cols
                [[1, 5, 9], [3, 5, 7]]              # diagonals

INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'
CENTER_SQUARE = 5
BOARD_LENGTH = 3
GRANDWINNER = 5
scores = {'Player' => 0, 'Computer' => 0}

def prompt(msg)
  puts "=> #{msg}"
end

def joinor(square_arr, delim = ', ', conjunction = 'or')
    #available_squares = ''
  
    case square_arr.size
    when 0 then ''
    when 1 then square_arr.first
    when 2 then square_arr.join(" #{conjunction} ")
    else 
      square_arr[-1] = "#{conjunction} #{square_arr.last}"
      square_arr.join(delim)
    end
end
    

def select_first_player
 prompt("Pick first player: (1) for Player; (2) for Computer; or (3), random pick.")
 selection = gets.chomp.to_i
 case selection
 when 1 then [1]
 when 2 then [2]
 when 3 then [[1, 2].sample]
 end
end

# rubocop: disable Metrics/AbcSize
def display_board(brd)
  system 'clear'
  puts "You're #{PLAYER_MARKER}. Computer is #{COMPUTER_MARKER}"
  puts ""
  puts "     |     |"
  puts "  #{brd[1]}  |  #{brd[2]}  |  #{brd[3]}   "
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[4]}  |  #{brd[5]}  |   #{brd[6]}  "
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[7]}  |  #{brd[8]}  |   #{brd[9]}  "
  puts "     |     |"
  puts ""
end
# rubocop: enable Metrics/AbcSize

def initialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = INITIAL_MARKER }
  new_board
end

def empty_squares(brd)
  brd.keys.select { |num| brd[num] == INITIAL_MARKER }
end

def player_places_piece!(brd)
  square = ''
  loop do
    prompt "Choose a square: #{joinor(empty_squares(brd))}"
    square = gets.chomp.to_i
    break if empty_squares(brd).include?(square)
    prompt("Sorry, that's not a valid choice")
  end
  brd[square] = PLAYER_MARKER
end


def determine_square(line,brd)
  brd.select{ |k,v| line.include?(k) && v == ' '}.keys.first
 end

def nil_square(brd)
  # pick 5
  if brd[CENTER_SQUARE] == ' '
    CENTER_SQUARE
  # pick random square
  else  
    empty_squares(brd).sample
  end
end


def computer_places_piece!(brd)
  square = nil
  
  WINNING_LINES.each do |line|
    # winning move
    if brd.values_at(*line).count(COMPUTER_MARKER) == 2
      square = determine_square(line,brd)
      break if square
    #defending move
    elsif brd.values_at(*line).count(PLAYER_MARKER) == 2
      square = determine_square(line, brd)
      break if square
    end
  end
  # if square is nil
  if !square
    square = nil_square(brd)
  end
  
  brd[square] = COMPUTER_MARKER
end

def place_piece!(brd, crnt_plyr)
  if crnt_plyr == [1]
    player_places_piece!(brd)
  elsif crnt_plyr == [2]
    computer_places_piece!(brd)
  end
end

def alternate_player(plyr)
  #switch current player
  plyr == [1] ? plyr[0] = [2] : plyr[0] = [1]
end


def board_full?(brd)
  empty_squares(brd).empty?
end

def someone_won?(brd)
  !!detect_winner(brd)
end

def detect_winner(brd)
  WINNING_LINES.each do |line|
    if brd.values_at(*line).count(PLAYER_MARKER) == BOARD_LENGTH
      return 'Player'
    elsif brd.values_at(*line).count(COMPUTER_MARKER) == BOARD_LENGTH
      return 'Computer'
    end
  end
  nil
end


def increment_score(winner,scores)
  winner == "Player" ? scores[winner] += 1 : scores[winner] += 1
end

def display_score(scores)
  prompt("Player score: #{scores['Player']}")
  prompt("Computer score: #{scores['Computer']}")
end
  
# main game loop
loop do
  board = initialize_board
  current_player = select_first_player
  
  loop do
  display_board(board)
  place_piece!(board, current_player)
  current_player = alternate_player(current_player)
  break if someone_won?(board) || board_full?(board)
    end
  
  display_board(board)
  
  if someone_won?(board)
    increment_score(detect_winner(board), scores)
    prompt("#{detect_winner(board)} won!")
    display_score(scores)
  else
    prompt("It's a tie!")
  end
  
  break if scores['Player'] == GRANDWINNER || scores['Computer'] == GRANDWINNER
end

prompt("Thanks for playing Tic Tac Toe. Goodbye!")
