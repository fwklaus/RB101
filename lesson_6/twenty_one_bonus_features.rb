CARD_VALUES = { 2 => 2, 3 => 3, 4 => 4, 5 => 5, 6 => 6, 7 => 7, 8 => 8, 9 => 9,
                10 => 10, "Jack" => 10, "Queen" => 10, "King" => 10,
                "Ace" => 11 }

WELCOME = <<MESSAGE
Welcome to Twenty-One!
  - While similar to Black Jack, the point of the game is to get as close as 
      possible to the number of your choosing, rather than 21,
        without going over, or "busting"
   
>> Instructions:
  -Select a number (21 or greater)
  -Each player starts the round with two cards 
     note: One of the dealer's cards is hidden
  -Play starts with you:
     -You can either "hit" or "stay"
     -If you bust, the round is over and the dealer wins
     -If you stay, turn passes to the dealer
  -The dealer's turn is identical to yours:
     -If the dealer stays and no one busts, both players show their hands
        
>> First to 5 is the grandwinner. Good luck!
    
MESSAGE

def initialize_twenty_one_value
  prompt("What do you want to play to? Enter a number (21 or greater).")
  answer = gets.chomp.to_i
  answer
end

def prompt(str)
  puts ">> #{str}"
end

def next_step
  exit_loop = false
  loop do
    prompt("Enter 'next' to proceed...")
    answer = gets.chomp.downcase
    exit_loop = true
    break if answer.start_with?('n')
  end
  exit_loop
end

def welcome_message
  loop do
    prompt("Do you want to see the instructions? (y/n)")
    answer = gets.chomp.downcase

    break if answer.start_with?('n')

    if answer.start_with?('y')
      system 'clear'
      prompt(WELCOME)
      break if next_step
    end
  end
end

# hides dealer's last card during play
def obfuscate_hand(cards)
  hand_copy = cards.clone
  hand_copy[-1] = "unknown card"
  hand_copy
end

# formats end of round card display
def game_over_joiner(hand)
  hand.map { |sub| sub.join(' of ') }
end

# formats in game card display
def joiner(hand, current_player, game_over = false)
  current_hand = hand[current_player]

  if current_player == "Dealer" && game_over == false
    current_hand = obfuscate_hand(current_hand)
  end

  if game_over == true
    current_hand = game_over_joiner(current_hand)
  end

  if current_hand.size <= 2
    return current_hand.join(' and ')
  end

  if current_hand.size > 2
    display_hand = current_hand.clone
    display_hand[-1] = "and #{display_hand.last}"
    display_hand.join(', ')
  end
end

# the array that is passed around
def working_hand(display_hand)
  players = ["Player", "Dealer"]
  working_hand = {}

  players.each do |key|
    working_hand[key] = display_hand[key].map do |sub_array|
      sub_array.select.with_index { |_el, idx| idx == 0 }
    end
  end

  working_hand.values.map(&:flatten!)
  working_hand
end

def display_cards(hand, game_over = false)
  hnd = working_hand(hand)

  if game_over == true
    puts "Dealer has: #{joiner(hand, 'Dealer', game_over)}"
    puts "You have: #{joiner(hand, 'Player', game_over)}"
  else
    puts "Dealer has: #{joiner(hnd, 'Dealer', game_over)}"
    puts "You have: #{joiner(hnd, 'Player', game_over)}"
  end
end

def initialize_deck
  deck = {}
  (2..14).each do |card|
    case card
    when 11 then  card = 'Jack'
    when 12 then  card = 'Queen'
    when 13 then  card = 'King'
    when 14 then  card = 'Ace'
    end

    deck[card] = ['hearts', 'diamonds', 'clubs', 'spades']
  end
  deck
end

def deal_card(dek, hnd, current_plyr)
  card = dek.keys.sample
  if dek[card].empty?
    dek.delete(card)
    card = dek.keys.sample
  end

  suit = dek[card].sample
  dek[card].delete(suit)

  if hnd[current_plyr].nil?
    hnd[current_plyr] = [[card, suit]]
  else
    hnd[current_plyr] << [card, suit]
  end
  hnd
end

def initialize_hand(dek)
  players = ["Player", "Dealer"]
  hand = {}

  2.times do |_|
    players.each do |player|
      hand = deal_card(dek, hand, player)
    end
  end
  hand
end

def calculate_hand_total(hand, current_player)
  cards_arr = hand[current_player]
  working_arr = cards_arr.map do |sub_array|
    sub_array.find { |el| el == sub_array[0] }
  end

  hand_total_with_ace11 = working_arr.map { |card| CARD_VALUES[card] }.sum

  hand_total = working_arr.map do |card|
    if card == "Ace" && hand_total_with_ace11 > TWENTY_ONE
      1
    else
      CARD_VALUES[card]
    end
  end.sum
  hand_total
end

def initialize_hand_values(player_cards, hand_vals)
  players = ["Player", "Dealer"]

  players.each do |player|
    hand_vals[player] = calculate_hand_total(player_cards, player)
  end
end

def busted?(hand_total)
  hand_total > TWENTY_ONE
end

def switch_player(current_plyr)
  current_plyr == "Dealer" ? "Player" : "Dealer"
end

def dealer_turn(hand_val)
  if hand_val >= TWENTY_ONE - 4
    prompt("Dealer stays")
    sleep(2)
    "stay"
  else
    prompt("Dealer hits")
    sleep(2)
    "hit"
  end
end

def player_turn
  answer = String.new
  loop do
    prompt("Player, would you like to hit or stay? (Enter 'hit', or 'stay')...")
    answer = gets.chomp.downcase

    break if answer == "hit" || answer == "stay"
    prompt("Oops, please enter 'hit', or 'stay'")
  end
  answer
end

def determine_winner(hand_value, busted)
  player_hand = hand_value["Player"]
  dealer_hand = hand_value["Dealer"]

  case busted
  when :Player then :dealer
  when :Dealer then :player
  else
    if player_hand > dealer_hand
      :player
    elsif dealer_hand > player_hand
      :dealer
    else
      :tie
    end
  end
end

def declare_winner(results)
  case results
  when :player
    prompt("Player wins the round!")
  when :dealer
    prompt("Dealer wins the round!")
  when :tie
    prompt("It's a tie")
  end
end

def show_hands(cards, hand_value)
  system 'clear'
  prompt("Show hands...")
  sleep(2)
  prompt("Player's holding: #{joiner(cards, 'Player', true)}.
    Player has #{hand_value['Player']}")
  prompt("Dealer's holding: #{joiner(cards, 'Dealer', true)}.
    Dealer has #{hand_value['Dealer']}")
end

def play_again?
  prompt("Play again? (y/n)")
  answer = gets.chomp
  if answer.downcase.start_with?('y')
    true
  elsif answer.downcase.start_with?('n')
    false
  end
end

def tally(result)
  case result
  when :player
    "Player"
  when :dealer
    "Dealer"
  when :tie
    "Tie"
  end
end

def determine_grand_winner(wins_tally)
  winner = wins_tally.select { |_key, value| value == 5 }.keys.join
  case winner
  when "Player" then :player
  when "Dealer" then :dealer
  end
end

def declare_grandwinner(winner)
  case winner
  when :player
    prompt("Player wins the game!!!")
  when :dealer
    prompt("Dealer wins the game!!!")
  end
end

def display_round(rnd)
  prompt("Round: #{rnd}")
end

def display_score(wins)
  prompt("Player score: #{wins['Player']}")
  prompt("Dealer score: #{wins['Dealer']}")
end

# main game loop
loop do
  system 'clear'
  welcome_message
  TWENTY_ONE = initialize_twenty_one_value
  wins = { "Player" => 0, "Dealer" => 0, "Tie" => 0 }
  round = 1

  loop do
    system 'clear'
    display_round(round)
    display_score(wins)
    deck = initialize_deck
    cards = initialize_hand(deck)
    hand_values = { "Player" => 0, "Dealer" => 0 }
    initial_player = "Dealer"
    busted = String.new
    result = nil

    loop do
      initialize_hand_values(cards, hand_values)
      game_over = false

      # player turn
      loop do
        prompt("Player turn...")
        current_player = switch_player(initial_player)
        hand = hand_values[current_player]
        stay = false

        loop do
          loop do
            display_cards(cards)
            if player_turn == "hit"
              deal_card(deck, cards, current_player)
            else
              stay = true
            end

            hand = calculate_hand_total(cards, current_player)
            break if busted?(hand) || stay
          end

          if busted?(hand)
            game_over = true
            busted = current_player.to_sym
            prompt("#{current_player} busts.")
            sleep(2)
          end
          break
        end
        hand_values[current_player] = hand
        break
      end

      # dealer turn
      loop do
        break if game_over
        system 'clear'
        prompt("Dealer turn...")

        loop do
          current_player = switch_player(current_player)
          hand = hand_values[current_player]
          stay = false
          sleep(2)

          loop do
            loop do
              break if busted?(hand) || stay
              display_cards(cards)

              if dealer_turn(hand) == "hit"
                deal_card(deck, cards, current_player)
              else
                stay = true
                game_over = true
              end

              hand = calculate_hand_total(cards, current_player)
              sleep(3)
            end

            if busted?(hand)
              game_over = true
              busted = current_player.to_sym
              prompt("#{current_player} busts. ")
              sleep(2)
            end
            break
          end
          hand_values[current_player] = hand
          break
        end
      end
      show_hands(cards, hand_values)
      result = determine_winner(hand_values, busted)
      declare_winner(result)
      break
    end
    wins[tally(result)] += 1
    break if wins["Player"] == 5 || wins["Dealer"] == 5
    round += 1
    next_step
  end
  winner = determine_grand_winner(wins)
  declare_grandwinner(winner)
  if !play_again?
    prompt("Thanks for playing! Goodbye")
    break
  end
end
