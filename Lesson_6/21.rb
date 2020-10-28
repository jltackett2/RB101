# Twenty One Game
SUITS = ["Spades", "Diamonds", "Hearts", "Clubs"]
CARDS = %w(2 3 4 5 6 7 8 9 10 Jack Queen King Ace)
CARD_VALUE_KEY = { "2" => 2,      "3" => 3,
                   "4" => 4,      "5" => 5,
                   "6" => 6,      "7" => 7,
                   "8" => 8,      "9" => 9,
                   "10" => 10,    "Jack" => 10,
                   "Queen" => 10, "King" => 10,
                   "Ace" => 11 }

def prompt(string)
  puts "==> #{string}"
end

def clear_screen
  system("clear") || system("cls")
end

def initialize_suits
  deck = {}
  SUITS.each { |suit| deck[suit] = [] }
  deck
end

def initialize_deck
  deck = initialize_suits
  CARDS.each do |num|
    deck.each_key do |key|
      deck[key] << num
    end
  end
  deck
end

def deal_card(hand, deck)
  new_card = []
  new_card << deck.keys.sample
  new_card << deck[new_card[0]].sample
  hand << new_card
  deck[new_card[0]].delete(new_card[1])
end

def add_cards(hand)
  values = hand.map { |card| card[1] }
  total = 0
  values.each do |value|
    total += CARD_VALUE_KEY[value]
  end
  values.select { |value| value == "Ace" }.count.times do
    total -= 10 if total > 21
  end
  total
end

def initial_deal(player_hand, comp_hand, deck)
  prompt("Starting new round...")
  puts " "
  2.times { deal_card(player_hand, deck) }
  2.times { deal_card(comp_hand, deck) }
end

def show_comp_cards(comp_hand, hidden_card = true)
  card_count = comp_hand.size - 1
  count = hidden_card ? 1 : 0
  prompt("Dealer has:")
  until count > card_count
    puts "      #{comp_hand[count][1]} of #{comp_hand[count][0]}"
    count += 1
  end
  if hidden_card
    puts "      Hidden Card"
  else
    puts "      --------------------"
    puts "      #{add_cards(comp_hand)} Total"
  end
end

def show_player_cards(player_hand)
  total = add_cards(player_hand)
  card_count = player_hand.size - 1
  count = 0
  prompt("You have:")
  until count > card_count
    puts "      #{player_hand[count][1]} of #{player_hand[count][0]}"
    count += 1
  end
  puts "      --------------------"
  puts "      #{total} Total"
end

def player_hit(player_hand, comp_hand, deck)
  clear_screen
  deal_card(player_hand, deck)
  show_comp_cards(comp_hand)
  show_player_cards(player_hand)
end

def comp_hit(comp_hand, deck)
  prompt("The dealer must hit.")
  continue
  deal_card(comp_hand, deck)
  show_comp_cards(comp_hand, false)
end

def player_turn(deck, player_hand, comp_hand)
  total = 0
  loop do
    total = add_cards(player_hand)
    if total <= 21
      break if hit_or_stay?(player_hand, comp_hand, deck)
    else
      prompt("You have busted!")
      continue
      break
    end
  end
end

def retrieve_hit_stay_decision
  puts " "
  prompt("Would you like to hit or stay?")
  prompt("Type 'h' for hit")
  prompt("Type 's' for stay")
  gets.chomp
end

# rubocop:disable Metrics/MethodLength
def hit_or_stay?(player_hand, comp_hand, deck)
  hit_stay = ''
  stay = false
  loop do
    hit_stay = retrieve_hit_stay_decision
    if hit_stay == "h"
      player_hit(player_hand, comp_hand, deck)
      break
    elsif hit_stay == "s"
      prompt("You have stayed. It is now the dealers turn.")
      continue
      stay = true
      break
    else
      prompt("Sorry, invalid selection.")
    end
  end
  stay
end

def dealer_turn(deck, comp_hand, player_hand)
  total = 0
  clear_screen
  show_player_cards(player_hand)
  show_comp_cards(comp_hand, false)
  loop do
    total = add_cards(comp_hand)
    if total <= 17
      comp_hit(comp_hand, deck)
    elsif total > 17 && total <= 21
      prompt("The dealer must stay.")
      continue
      break
    else
      prompt("The dealer busted.")
      continue
      break
    end
  end
end
# rubocop:enable Metrics/MethodLength

def continue
  prompt("Press enter to continue...")
  gets
end

def round_outcome(player_hand, comp_hand, round_winner)
  comp_total = add_cards(comp_hand)
  player_total = add_cards(player_hand)
  prompt("Player has: #{player_total} || Dealer has: #{comp_total}")
  announce_winner(comp_total, player_total, round_winner)
  continue
  clear_screen
end

def announce_winner(comp_total, player_total, round_winner)
  if player_total <= 21 && ((comp_total > 21) || (comp_total < player_total))
    prompt("Player wins the round!")
    round_winner << "player"
  elsif (comp_total == player_total) && player_total <= 21
    prompt("Tie!")
  else
    prompt("Dealer wins the round!")
    round_winner << "dealer"
  end
end

def start_game
  prompt("Welcome to 21.")
  prompt("Rules:")
  puts "        The closest to 21 without busting wins."
  puts "        If dealer and player bust, dealer wins."
  puts "        If dealer and player have same value, then they tie."
  puts "        First to win 5 rounds wins the overall game."
  puts " "
end

def play_again?
  loop do
    prompt("Would you like to play again?")
    puts "    Type 'y' for yes, 'n' for no."
    answer = gets.chomp.downcase
    if answer == "y"
      clear_screen
      prompt("Starting new game!")
      return true
    elsif answer == "n"
      return false
    else
      prompt("Sorry, invalid input.")
    end
  end
end

def game_winner?(round_winner)
  player_win_num = round_winner.count("player")
  comp_win_num = round_winner.count("dealer")
  if player_win_num == 5
    game_scoreboard(round_winner)
    prompt("Player was first to win 5 rounds. Player wins!")
    puts " "
    true
  elsif comp_win_num == 5
    game_scoreboard(round_winner)
    prompt("Dealer was first to win 5 rounds. Dealer wins!")
    puts " "
    true
  else
    false
  end
end

def game_scoreboard(round_winner)
  puts " "
  puts "   Scoreboard"
  puts "----------------"
  puts "Player wins: #{round_winner.count('player')}"
  puts "Dealer wins: #{round_winner.count('dealer')}"
  puts "----------------"
  puts " "
end

clear_screen
start_game
round_winner = []

loop do
  loop do
    game_scoreboard(round_winner)
    player_hand = []
    comp_hand = []
    deck = initialize_deck
    initial_deal(player_hand, comp_hand, deck)
    show_comp_cards(comp_hand)
    show_player_cards(player_hand)
    player_turn(deck, player_hand, comp_hand)
    dealer_turn(deck, comp_hand, player_hand)
    round_outcome(player_hand, comp_hand, round_winner)
    break if game_winner?(round_winner)
  end
  break unless play_again?
end
prompt("Goodbye, thanks for playing!")
