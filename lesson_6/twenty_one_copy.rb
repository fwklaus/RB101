require "pry-byebug"
=begin
1. Initialize deck
2. Deal cards to player and dealer
3. Player turn: hit or stay
  - repeat until bust or "stay"
4. If player bust, dealer wins.
5. Dealer turn: hit or stay
  - repeat until total >= 17
6. If dealer bust, player wins.
7. Compare cards and declare winner.

=end

# 1)
# initialize deck
# no input
# outputs hash

# -52 cards:
#    -4 suits(hearts,diamonds, clubs, spades)
#       -2,3,4,5,6,7,8,9,10,jack,queen,king,ace(4 of each)

# data structures
# - hash: - each card for a key
#         - array for a value (suit)     
# 

# 2)
# deal cards
# input: no input
# output: four cards (array), any additional cards if players hit
# 
## data structures/algorithm
# sample
# loop
# -initialize hash to store player and dealer cards
# -begin loop
#   -sample deck keys
#   -save key to variable
#   -sample suit values at sampled key
#   -remove suit from array
#   -store card in hash at current player
# -end loop if two cards have been selected

## deal cards
# -  times
# -  array 
# -  each
# -  sample
# -  create two-element array - player, and dealer
# -  intialize empty hash

##  deal cards
# - need to deal two cards per player to initialize hand
# - for each element of array, assign key(card) - value(suit) pair to empty hash 
#        -(suit is uneccesary)
# - set card = to random card value
# - delete suit from card values array for current card
#       -(this is only to keep track of how many of a particular card remain)

# how do we sample cards?
#    - sample cards first
#    - sample suits second
#           -cards in player/dealers hands must be removed from deck after they are dealt 

# 3) Player turn: hit or stay

# start game
# player is set to "Player"
# player chooses to hit or stay
#        -break out of loop if stay
#           -switch player
#        -if hit
#            - deal a card
#            - get the value of the hand
#                 if player busts, game over
# -repeat hit or stay


# player turn
# display hands 
# prompt user if they'd like to hit or stay
# validate input
# end player turn if stay
# if hit, deal a card
# end game if bust
    
# neet to handle stay, hit, and bust

# display hands
# example:
# Dealer has: 5 and unknown card
# You have: Jack and 6

# you hit
# Dealer has: 5 and unknown card
# You have: Jack, 6, and Ace


#joiner
# input: current_player, hash
# output: string

# size
# how do we display array after hitting?
# - for display we should only be messing with copies, not the original hash
# - make array of cards for current player
# - if current player is Dealer
#       -   call method that creates copy of array, and hides second value
#       -   method takes array
#       -   returns copy of array with last value of "unknown card"
#               -   last element is displayed as unknown
# - if size of array is less than 2
#       - delimit elements with 'and'
# - if size of array is greater than 2
#       - use default delimiter 
#       - use and to delimit the last element 




# determine_bust
# map
# sum
# use hash to store conversion values for cards - constant

# add up value of hand prior to evaluating ace 
# iterate over cards_arr
# check current player hand for ace
#    -if hand has ace and hand_total exceeds 21
#       - set ace = to 1
#    -if hand has ace but hand_total is less than 21
#       - ace remains set = to 11
#    -either way, if hand exceeds 21, player busts
#            -dealer wins
#            -break out of loop
#    -if player doesn't bust repeat prompt
#    -if stay pass turn to dealer
#

# 5 ) Dealer turn: repeat until total >= 17

# if current player is Dealer
#  -automate response
#     - if hand_value is greater than or equal to 17, stay
#     - else hit
#_______________________________________________________________________________


CARD_VALUES = { 2 => 2, 3 => 3, 4 => 4, 5 => 5, 6 => 6, 7 => 7, 8 => 8,  9 => 9,
  10 => 10, "Jack" => 10, "Queen" => 10, "King" => 10, "Ace" => 11 }

def prompt(str)
  puts ">> #{str}"
end

# 1) Initialize deck

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

# 2) Deal cards to player and dealer

def deal_card(dek, hnd, current_plyr)
  card = dek.keys.sample
  suit = dek[card].sample
  
  dek[card].delete(suit)
          
  hnd[current_plyr] == nil ? hnd[current_plyr] = [card] : hnd[current_plyr] << card

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

# 3) Player Turn

def obfuscate_hand(cards)
  hand_copy = cards.clone
  hand_copy[-1] = "unknown card"
  hand_copy
end


def joiner(hand, current_player, game_over = false , delim = ', ')
   current_hand = hand[current_player]
    
    if current_player == "Dealer" && game_over == false
      current_hand = obfuscate_hand(current_hand)
    end
      
    if current_hand.size <= 2
      if current_player == "Dealer"
        return current_hand.join(' and ') 
      elsif current_player == "Player"
        return current_hand.join( ' and ')
      end
    end
    
    if current_hand.size > 2
      if current_player == "Dealer"
        current_hand[-1] = "and #{current_hand.last}"
        return current_hand.join(delim)
      elsif current_player == "Player"
        player_hand = current_hand.clone
        player_hand[-1] = "and #{player_hand.last}"
        return player_hand.join(delim)
      end
    end
   
end

def display_cards(hand)
  system 'clear'
  puts "Dealer has: #{joiner(hand, "Dealer")}"
  puts "You have: #{joiner(hand, "Player")}"
end

def player_busts?(hand_total)
  #player busts should take value of the hand and current player
  hand_total > 21
end

def hand_total(hand, current_player)
  cards_arr = hand[current_player]
  hand_total_with_ace_set_to_11 = cards_arr.map{ |card| CARD_VALUES[card] }.sum
  
  hand_total = cards_arr.map do |card|
    if card == "Ace" && hand_total_with_ace_set_to_11 > 21
       card = 1
    else
       CARD_VALUES[card]
    end
  end.sum
  hand_total
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

def hit_or_stay(cards, player)
  prompt("Player, would you like to hit or stay? (Enter 'hit', or 'stay')...")
  answer = gets.chomp.downcase
  
end

def switch_player(current_plyr)
  current_plyr == "Dealer" ? "Player" : "Dealer"
end

def show_hands(cards, hand_value)
  system 'clear'
  prompt("Player's holding: #{joiner(cards, "Player")}. Player has #{hand_value["Player"]}")
  prompt("Dealer's holding: #{joiner(cards, "Dealer", true)}. Dealer has #{hand_value["Dealer"]}")
  
end

def declare_winner(hand_value)
  
  player_hand = hand_value["Player"]
  dealer_hand = hand_value["Dealer"]

  
  if player_hand > dealer_hand && !busted?(player_hand)
     prompt("Player wins the round.")
  elsif dealer_hand > player_hand && !busted?(dealer_hand)
     prompt("Dealer wins the round.")
  elsif player_hand == dealer_hand
    prompt("Player and dealer tie.")
  elsif player_hand <= 21 && busted?(dealer_hand)
    prompt("Player wins the game")
  elsif dealer_hand <= 21 && busted?(player_hand)
    prompt("Dealer wins the game")
  end
  
end

# need to determine if player busted to declare winner 
# takes hand_values
# returns bool

def busted?(hand_value)
  hand_value > 21
end



# main game loop
loop do 
  system 'clear'
  deck = initialize_deck
  cards = initialize_hand(deck)
  game_over = false
  player = "Dealer"
  hand_value = {"Player" => 0, "Dealer" => 0}
  both_stay = false

  loop do
      player = switch_player(player)
      
      #player turn
    loop do
      display_cards(cards)
      if player == "Player"
        
        choice = hit_or_stay(cards, player)
        hand_value[player] = hand_total(cards, player)
        break if choice == "stay"
    
        if choice == "hit"
          deal_card(deck, cards, player)
          hand_value[player] = hand_total(cards, player)
        end
      
         if player_busts?(hand_value[player])
          game_over = true
          show_hands(cards, hand_value)
          prompt("#{player} busts. #{switch_player(player)} wins")
         end
         
         break if game_over
      end
    end
    break if game_over
      
    # dealer turn
    player = switch_player(player)
    loop do
      display_cards(cards)
      hand_value[player] = hand_total(cards, player)
        if hand_value[player] >= 17
          prompt("Dealer stays")
          sleep(5)
          both_stay = true
          game_over = true
        else
          prompt("Dealer hits")
          deal_card(deck, cards, player)
          sleep(4)
        end
        
        hand_value[player] = hand_total(cards, player)
        
        if player_busts?(hand_value[player])
          prompt("#{player} busts. #{switch_player(player)} wins")
          sleep(4)
          game_over = true
          show_hands(cards, hand_value)
        end
        break if game_over
      sleep(3)
      end
      break if game_over
     end

      
     

show_hands(cards, hand_value) if both_stay
declare_winner(hand_value)

if !play_again?
  prompt("Thanks for playing! Goodbye")
  break
end      
end
    