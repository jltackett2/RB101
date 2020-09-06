VALID_CHOICES = ["rock", "paper", "scissors", "Lizard", "Spock"]
def test
  prompt("This is a test")
end

def prompt(message)
  puts "=> #{message}"
end

def display_results(choice, computer_choice)
  if (choice == "rock" && computer_choice == "scissors") ||
      (choice == "paper" && computer_choice == "rock") ||
      (choice == "scissors" && computer_choice == "paper")
    prompt ("You won!")
  elsif choice == computer_choice
    prompt("It's a tie!")
  else
    prompt("Computer wins!")
  end
end

loop do
  choice = ""
  loop do
    prompt("Choose one: #{VALID_CHOICES.join(', ')}")
    choice = gets.chomp

    if VALID_CHOICES.include?(choice)
      break
    else
      prompt("Thats not a valid choice.")
    end
  end

  computer_choice = VALID_CHOICES.sample

  prompt("You chose: #{choice}")
  puts("Computer chose: #{computer_choice}")

  display_results(choice, computer_choice)

  prompt("Do you want to play again?")
  answer = gets.chomp
  break unless answer.downcase == "y"
end

prompt("Thank you for playing!")
