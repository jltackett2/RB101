# rock paper scissors game with extra features
# keeps track of score for mulitple rounds
require "yaml"
WIN_CONDITION = YAML.load_file "rock_paper_scissors.yml"

COMP_VALID_CHOICES = %w(rock paper scissors lizard spock)
USER_VALID_CHOICES = %w(1 2 3 4 5)

user_selection_key = { "1" => "rock",
                       "2" => "paper",
                       "3" => "scissors",
                       "4" => "lizard",
                       "5" => "Spock" }

def prompt(string)
  puts ">>> #{string}"
end

def start_round
  puts ""
  prompt("Hit enter to continue...")
  gets
  system("clear") || system("cls")
end

def show_selections(user_name, user_selection_key,
                    user_selection, computer_selection)
  puts ""
  prompt("#{user_name} selected: #{user_selection_key[user_selection]}")
  prompt("Computer selected: #{computer_selection}")
  puts ""
end

def user_wins_round?(user_selection, computer_selection, user_selection_key)

  if WIN_CONDITION[user_selection.to_i].include?(computer_selection)
    return true
  elsif user_selection_key[user_selection] == computer_selection
    return nil
  else
    return false
  end
end

def number_of_games_prompt
  puts ""
  prompt("To win this game:")
  prompt("Be the first to reach desired number of wins!")
  puts ""
  prompt("How many wins would you like to play to?")
  prompt("(1 up to and including 10 games allowed)")
end

def scoreboard(user_name, user_wins, comp_wins, win_number)
  puts ""
  puts "------------------SCOREBOARD------------------"
  prompt("Needed to win: #{win_number}")
  puts("----------------------")
  prompt("Computer score: #{comp_wins}")
  prompt("#{user_name} score: #{user_wins}")
  puts "----------------------------------------------"
  puts ""
end

def user_selection_prompt
  prompt("Please select:")
  prompt("Type '1' for rock")
  prompt("Type '2' for paper")
  prompt("Type '3' for scissors")
  prompt("Type '4' for lizard")
  prompt("Type '5' for Spock")
end

def get_user_choice
  loop do # user_selection and validation loop
    user_selection_prompt
    user_choice = gets.chomp.strip

    if USER_VALID_CHOICES.include?(user_choice)
      return user_choice
    else
      prompt("Sorry, invalid input.")
    end
  end
end

def rock_paper_scissors_shoot_display
  prompt("ROCK, PAPER, SCISSORS, LIZARD, SPOCK SHOOT!")
  puts ""
end

def game_winner?(comp_wins, user_wins, win_number)
  comp_wins == win_number || user_wins == win_number
end

def start_new_game_display
  system("clear") || system("cls")
  prompt("Excellent, starting new game!")
  puts "----------------------------------------------"
  puts ""
end

def valid_exit_input?(exit)
  exit == "exit" || exit == ""
end

def exit?
  loop do
    puts ""
    prompt("Please hit enter to start a new game, or type 'exit' to quit.")
    exit = nil
    exit = gets.chomp.downcase.strip

    if valid_exit_input?(exit)
      if exit == "exit"
        return true
      else
        return false
      end
    else
      prompt "Sorry, invalid input."
    end
  end
end

def user_wins_game?(user_wins, win_number, user_name)
  if user_wins == win_number
    prompt("Congrats! #{user_name} was first to #{win_number}!")
  else
    prompt("Sorry, computer was first to #{win_number}")
  end
end
# ----------------------------------------------------------
# game welcome
system("clear") || system("cls")

prompt("Welcome to Rock, Paper, Scissors...now with Lizard and Spock!")
user_name = ""

while user_name.strip.empty? do
  prompt("Please enter your name:")
  user_name = gets.chomp
end

prompt("Thank you, #{user_name}.")

loop do # go_again loop
  win_number = 0

  loop do # win number selection loop
    number_of_games_prompt
    win_number = gets.chomp.strip.to_i

    if [1, 2, 3, 4, 5, 6, 7, 8, 9, 10].include?(win_number) # win_number validation
      prompt("Ok, first to #{win_number} wins!")
      break
    else
      prompt("Sorry, invalid input!")
    end
  end

  start_round

  user_wins = 0
  comp_wins = 0

  # limits number of rounds to win number
  until (comp_wins == win_number) || (user_wins == win_number)

    scoreboard(user_name, user_wins, comp_wins, win_number)

    rock_paper_scissors_shoot_display

    user_selection = get_user_choice

    computer_selection = COMP_VALID_CHOICES.sample

    show_selections(user_name, user_selection_key,
                    user_selection, computer_selection)

    if user_wins_round?(user_selection, computer_selection, user_selection_key)
      prompt("#{user_name} wins the round!")
      user_wins += 1
    elsif user_wins_round?(user_selection, computer_selection, user_selection_key) == false
      prompt("Computer wins the round!")
      comp_wins += 1
    else
      prompt("Tie! Starting round over....")
    end

    scoreboard(user_name, user_wins, comp_wins, win_number)
    start_round
  end

  user_wins_game?(user_wins, win_number, user_name)

  if exit?
    break
  else
    start_new_game_display
  end
end

prompt("Goodbye!")
