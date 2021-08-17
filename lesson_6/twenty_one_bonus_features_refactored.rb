GRANDWINNER = 5
CARD_VALUES = { 2 => 2, 3 => 3, 4 => 4, 5 => 5, 6 => 6, 7 => 7, 8 => 8, 9 => 9,
                10 => 10, "Jack" => 10, "Queen" => 10, "King" => 10,
                "Ace" => 11 }

WELCOME = <<MESSAGE
Welcome to Twenty-One!
  - While similar to Black Jack, the point of the game is to get as close as 
      possible to the number of your choosing, rather than 21,
        without going over, or "busting"
   
>> Instructions:
  -Select a number (between 21 and 99)
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
  answer = 0
  loop do
    prompt("What do you want to play to? Enter a number between 21 and 99.")
    answer = gets.chomp.to_i
    break if answer >= 21 && answer <= 99
    prompt("Oops, please enter a number between 21 and 99.")
  end
  answer
end

def prompt(str)
  puts ">> #{str}"
end

def enter_to_continue
  prompt("Press enter to continue...")
  STDIN.gets
end

def welcome_message
  loop do
    prompt("Do you want to see the instructions? Enter (y)es or (n)o.")
    answer = gets.chomp.downcase

    break if answer == 'n' || answer == 'no'

    if answer == 'y' || answer == 'yes'
      system 'clear'
      prompt(WELCOME)
      break if enter_to_continue
    end
    prompt("Oops, please enter (y)es or (n)o.")
  end
end

# hides dealer's last card during play
def obfuscate_hand(cards)
  hand_copy = cards.clone
  hand_copy[-1] = "unknown card"
  hand_copy
end

# formats end of round card display
def full_card_joiner(hand)
  hand.map { |sub| sub.join(' of ') }
end

# formats in game card display
def joiner(hand, current_player, show_cards = false)
  current_hand = hand[current_player]
  current_hand = full_card_joiner(current_hand)

  if current_player == "Dealer" && show_cards == false
    current_hand = obfuscate_hand(current_hand)
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

def display_cards(hand, hand_values, game_over = false)
  puts "Dealer has: #{joiner(hand, 'Dealer', game_over)}
        Dealer has: ???"
  puts "You have: #{joiner(hand, 'Player', game_over)}
        Player has: #{hand_values['Player']}"
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

def hand_total_ace11(cards)
  cards.map { |value, suit| CARD_VALUES[value] * suit.size }.sum
end

def adjust_hand_total(cards, hand_total)
  if cards.include?("Ace") && hand_total > TWENTY_ONE
    (cards["Ace"].size).times do |_|
      break if hand_total <= TWENTY_ONE
      hand_total -= 10
    end
  end
  hand_total
end

def calculate_hand_total(hand, current_player)
  cards_hsh = {}
  hand[current_player].each do |key, value|
    cards_hsh.include?(key) ? cards_hsh[key] << value : cards_hsh[key] = [value]
  end

  hand_total_with_ace11 = hand_total_ace11(cards_hsh)
  adjust_hand_total(cards_hsh, hand_total_with_ace11)
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
    prompt("Player, would you like to hit or stay?")
    prompt("Enter '(h)it', or '(s)tay')...")
    answer = gets.chomp.downcase

    break if answer == 'hit'  || answer == 'h'
    break if answer == 'stay' || answer == 's'
    prompt("Oops, please enter '(h)it', or '(s)tay'")
  end
  answer
end

def determine_round_winner(hand_value, busted)
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

def declare_round_winner(results)
  case results
  when :player
    prompt("Player wins the round!")
  when :dealer
    prompt("Dealer wins the round!")
  when :tie
    prompt("It's a tie")
  end
end

def show_hands(cards, hand_value, game_over = false)
  system 'clear'
  prompt("Show hands...")
  sleep(2)
  prompt("Player's holding: #{joiner(cards, 'Player', game_over)}.
    Player has #{hand_value['Player']}")
  prompt("Dealer's holding: #{joiner(cards, 'Dealer', game_over)}.
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
            display_cards(cards, hand_values, game_over)
            move = player_turn
            if move == 'hit' || move == 'h'
              deal_card(deck, cards, current_player)
            elsif move == 'stay' || move == 's'
              stay = true
            end

            hand = calculate_hand_total(cards, current_player)
            hand_values[current_player] = hand
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
              display_cards(cards, hand_values, game_over)

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
      show_hands(cards, hand_values, game_over)
      result = determine_round_winner(hand_values, busted)
      declare_round_winner(result)
      break
    end
    wins[tally(result)] += 1
    break if wins["Player"] == GRANDWINNER || wins["Dealer"] == GRANDWINNER
    round += 1
    enter_to_continue
  end
  winner = determine_grand_winner(wins)
  declare_grandwinner(winner)

  break unless play_again?
end

prompt("Thanks for playing! Goodbye")
