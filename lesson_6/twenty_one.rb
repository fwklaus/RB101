CARD_POSITION = 0
CARD_VALUES = { 2 => 2, 3 => 3, 4 => 4, 5 => 5, 6 => 6, 7 => 7, 8 => 8, 9 => 9,
                10 => 10, "Jack" => 10, "Queen" => 10, "King" => 10,
                "Ace" => 11 }

WELCOME = <<MESSAGE
Welcome to Twenty-One!

Each player gets two cards: Player's cards are face up. One of the dealer's cards is hidden.
  Play starts with you, the player:
    -You can either "hit" or "stay"
    -If you bust, the game is over, and dealer wins
    -If you stay, turn passes to the dealer
  The dealer's turn is identical to yours:
    -If the dealer stays and no one busts, both players show their hands
        
      ...May the better hand win. Good luck!
    
MESSAGE

def prompt(str)
  puts ">> #{str}"
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

def obfuscate_hand(cards)
  hand_copy = cards.clone
  hand_copy[-1] = "unknown card"
  hand_copy
end

def game_over_joiner(hand)
  hand.map { |sub| sub.join(' of ') }
end

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

def display_cards(hand, game_over = false)
  hnd = working_hand(hand)
  system 'clear'

  if game_over == true
    puts "Dealer has: #{joiner(hand, 'Dealer', game_over)}"
    puts "You have: #{joiner(hand, 'Player', game_over)}"
  else
    puts "Dealer has: #{joiner(hnd, 'Dealer', game_over)}"
    puts "You have: #{joiner(hnd, 'Player', game_over)}"
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

def initialize_hand_values(player_cards, hand_vals)
  players = ["Player", "Dealer"]

  players.each do |player|
    hand_vals[player] = calculate_hand_total(player_cards, player)
  end
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

def calculate_hand_total(hand, current_player)
  cards_arr = hand[current_player]
  working_arr = cards_arr.map do |sub_array|
    sub_array.find { |el| el == sub_array[0] }
  end

  hand_total_with_ace11 = working_arr.map { |card| CARD_VALUES[card] }.sum

  hand_total = working_arr.map do |card|
    if card == "Ace" && hand_total_with_ace11 > 21
      1
    else
      CARD_VALUES[card]
    end
  end.sum
  hand_total
end

def busted?(hand_total)
  hand_total > 21
end

def switch_player(current_plyr)
  current_plyr == "Dealer" ? "Player" : "Dealer"
end

def dealer_turn(hand_val)
  if hand_val >= 17
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
  prompt("Player, would you like to hit or stay? (Enter 'hit', or 'stay')...")
  answer = gets.chomp.downcase

  answer == "hit" ? "hit" : "stay"
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
    prompt("Player wins the game!")
  when :dealer
    prompt("Dealer wins the game!")
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
  prompt("Play another round?")
  answer = gets.chomp
  if answer.downcase.start_with?('y')
    true
  elsif answer.downcase.start_with?('n')
    false
  end
end

# main game loop
loop do
  system 'clear'
  welcome_message
  deck = initialize_deck
  cards = initialize_hand(deck)
  hand_values = { "Player" => 0, "Dealer" => 0 }
  initial_player = "Dealer"
  busted = String.new

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
  if !play_again?
    prompt("Thanks for playing! Goodbye")
    break
  end
end
