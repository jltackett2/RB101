# Tic-Tac-Toe Game
require "pry"

PLAYER_MARK = "X"
COMP_MARK = "O"
WIN_CONDITION = [[1, 2, 3], [4, 5, 6],
                 [7, 8, 9], [1, 4, 7],
                 [2, 5, 8], [3, 6, 9],
                 [1, 5, 9], [3, 5, 7]]

def prompt(string)
  puts "--> #{string}"
end

# rubocop:disable Metrics/AbcSize
def display_board(brd)
  prompt("User mark appears as #{PLAYER_MARK}")
  prompt("Computer mark appears as #{COMP_MARK}")
  puts ""
  puts "     |     |"
  puts "  #{brd[1]}  |  #{brd[2]}  |  #{brd[3]}"
  puts "     |     |"
  puts "-----------------"
  puts "     |     |"
  puts "  #{brd[4]}  |  #{brd[5]}  |  #{brd[6]}"
  puts "     |     |"
  puts "-----------------"
  puts "     |     |"
  puts "  #{brd[7]}  |  #{brd[8]}  |  #{brd[9]}"
  puts "     |     |"
  puts ""
end
# rubocop:enable Metrics/AbcSize

def initialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = num.to_s }
  new_board
end

def empty_squares(board)
  board.keys.select do |num|
    board[num] != PLAYER_MARK && board[num] != COMP_MARK
  end
end

def valid_choice?(board, user_move)
  if user_move != user_move.to_i.to_s
    false
  elsif user_move.to_i > 9
    false
  elsif user_move.to_i < 0
    false
  else empty_squares(board).include?(user_move.to_i)
  end
end

def available_moves(board)
  joiner(empty_squares(board))
end

def joiner(array, seperator = ", ", final_sep = "or ")
  if array.count == 2
    array.join(" ").insert(-2, final_sep)
  elsif array.count > 1
    array.join(seperator).insert(-2, final_sep)
  else
    array.join
  end
end

def place_user_piece(board) # gets and places user mark on board
  user_move = ""

  loop do
    puts ""
    prompt("Please select square #{available_moves(board)}.")
    user_move = gets.chomp
    break if valid_choice?(board, user_move) == true
    prompt("Sorry, invalid choice.")
  end

  user_move = user_move.to_i
  board[user_move] = PLAYER_MARK
end

def available_blocks(board)
  check_these_pieces = []
  WIN_CONDITION.each do |sub_array|
    check_these_pieces << [board[sub_array[0]],
                           board[sub_array[1]],
                           board[sub_array[2]]]
  end
  please_block = check_these_pieces.select do |sub_array|
    sub_array.count { |piece| piece == PLAYER_MARK } == 2
  end

  please_block.flatten!
  please_block.delete(PLAYER_MARK)
  please_block.delete(COMP_MARK)
  please_block
end

def winning_moves(board)
  check_these_pieces = []
  WIN_CONDITION.each do |sub_array|
    check_these_pieces << [board[sub_array[0]],
                           board[sub_array[1]],
                           board[sub_array[2]]]
  end
  please_win = check_these_pieces.select do |sub_array|
    sub_array.count { |piece| piece == COMP_MARK } == 2
  end
  please_win.flatten!
  please_win.delete(PLAYER_MARK)
  please_win.delete(COMP_MARK)
  please_win
end

def place_comp_piece(board) # gets/places computer mark on board
  if winning_moves(board).empty?
    if available_blocks(board).empty?
      if board[5] == "5"
        board[5] = COMP_MARK
      else
        board[empty_squares(board).sample] = COMP_MARK
      end
    else
      board[available_blocks(board).sample.to_i] = COMP_MARK
    end
  else
    board[winning_moves(board).sample.to_i] = COMP_MARK
  end
end

def board_full?(board) # checks for available moves
  empty_squares(board).empty?
end

def user_winner?(board)
  user_pieces = board.keys.select { |num| board[num] == PLAYER_MARK }
  check_user_winner = []

  user_pieces.combination(3).to_a.each do |sub_arr|
    check_user_winner << WIN_CONDITION.include?(sub_arr)
  end

  check_user_winner.include?(true) ? true : false
end

def comp_wins?(board)
  comp_pieces = board.keys.select { |num| board[num] == COMP_MARK }
  check_comp_winner = []

  comp_pieces.combination(3).to_a.each do |sub_arr|
    check_comp_winner << WIN_CONDITION.include?(sub_arr)
  end

  check_comp_winner.include?(true) ? true : false
end

def winner_tie?(board)
  if user_winner?(board)
    prompt("User wins the round!")
    puts ""
    true
  elsif comp_wins?(board)
    prompt("Comp wins the round!")
    puts ""
    true
  elsif board_full?(board)
    prompt("The round is a tie!")
    puts ""
    true
  else
    false
  end
end

def greeting
  puts ""
  prompt("Welcome to tic-tac-toe!")
  puts "------------------------------"
  puts ""
end

def clear_screen
  system("clear") || system("cls")
end

def start_new_game
  clear_screen
  prompt("Clearing last game...")
  prompt("Starting new game...")
  puts "------------------------------"
  puts ""
end

def start_new_round
  prompt("Clearing last game...")
  prompt("Starting new game...")
  puts "------------------------------"
  puts ""
end

def play_again?
  play_choice = ""
  loop do # valid? play again choice loop
    prompt("Would you like to play again? (y/n)")
    play_choice = gets.chomp.downcase
    if play_choice == "y"
      start_new_game
      break
    elsif play_choice == "n"
      prompt("Thank you for playing! Goodbye!")
      break
    else
      prompt("Sorry, please select a 'y' or 'n' only.")
    end
  end
  play_choice == "y"
end

def number_of_games
  wins = 0
  loop do
    prompt("Please select required number of wins:")
    wins = gets.chomp.to_i
    if wins > 1
      prompt("Ok, first to win #{wins} rounds wins the game!")
      break
    elsif wins == 1
      prompt("Ok, first to win #{wins} round wins the game!")
      break
    else
      prompt("Sorry, invalid input.")
    end
  end
  wins
end

def score_board(user_score, comp_score)
  puts ""
  puts "-----------------------"
  puts " Comp: #{comp_score} || User: #{user_score}"
  puts "-----------------------"
end

def assign_player_one
  assign_player = ""
  loop do
    puts ""
    prompt("Who would you like to go first?")
    prompt("Type 1 for User")
    prompt("Type 2 for Computer")
    assign_player = gets.chomp

    if assign_player == "1" || assign_player == "2"
      break
    else
      prompt("Sorry, please select 1 or 2.")
    end
  end
  assign_player
end

# Game start
clear_screen
greeting

loop do # play again loop
  winner = number_of_games

  player_one = if assign_player_one == "1"
                 "User"
               else
                 "Computer"
               end

  clear_screen

  user_score = 0
  comp_score = 0

  loop do # winner check loop
    board = initialize_board

    loop do # game loop
      if player_one == "User"
        score_board(user_score, comp_score)
        display_board(board)
        place_user_piece(board)
        clear_screen
        place_comp_piece(board)
        break if winner_tie?(board)
      else
        place_comp_piece(board)
        score_board(user_score, comp_score)
        display_board(board)
        break if winner_tie?(board)
        place_user_piece(board)
        clear_screen
      end
    end

    if user_winner?(board) # update scores
      display_board(board)
      user_score += 1
    elsif comp_wins?(board)
      comp_score += 1
    end

    if user_score == winner # checks for overall game winner
      prompt("User was first to #{winner}. USER WINS!")
      break
    elsif comp_score == winner
      prompt("Computer was first to #{winner}. COMPUTER WINS!")
      break
    else
      start_new_round
    end
  end

  answer = play_again? # ask if user wants to play again and return true/false
  break if answer == false # ends game
end
