# Write a mortgage calculator that takes three inputs:
# 1 - the loan amount == loan_amt
# 2 - the annual percentage rate(ex. 5% or .05) == apr
# 3 - the loan duration (in months or years) == loan_dur

# outputs
# 1 - monthly_int_rate == monthly interest rate
# 2 - months_loan_dur == loan duration (in months)
# 3 - monthly_payment == monthly payment

# given the formula
# monthly_payment = loan_amt(monthly_int_rate /
# (1 - (1 + monthly_int_rate)**(-months_loan_due)))
def prompt(string)
  puts ">>> #{string}"
end

def loan_amt_val?(loan_amt)
  loan_amt.to_i.to_s == loan_amt && loan_amt.empty? == false
end

def apr_val?(input_apr)
  if input_apr.include? "."
    input_apr.to_f.to_s == input_apr &&
      input_apr.empty? == false &&
      input_apr.to_f > 0
  else
    input_apr.to_i.to_s == input_apr &&
      input_apr.empty? == false &&
      input_apr.to_i > 0
  end
end

def loan_dur_val?(month_loan_dur)
  month_loan_dur.to_i.to_s == month_loan_dur &&
    month_loan_dur.empty? == false &&
    month_loan_dur.to_i > 0
end

# Welcome user
prompt("Welcome to the loan calculator!")

loop do # Start main loop
  loan_amt = ''
  input_apr = ''
  apr = ''
  month_loan_dur = ''

  loop do # confirmation loop
    loop do # loan amount input loop
      prompt("Please enter the loan amount:")
      prompt("ex: $1,000 entered as 1000)")
      loan_amt = gets.chomp

      if loan_amt_val?(loan_amt)
        break
      else
        prompt("Sorry, you entered an invalid loan amount.")
      end
    end

    loop do # GET APR from user as percentage(i.e 5.95% not .0595)
      prompt("Please enter you Annual Percentage Rate:")
      prompt("ex: 5.95% entered as 5.95")
      input_apr = gets.chomp

      if apr_val?(input_apr)
        break
      else
        prompt("Sorry, you entered an invalid APR.")
      end
    end

    apr = input_apr.to_f / 100 # SET apr = user input / 100

    loop do # GET loan duration in months from user
      prompt("Please enter loan duration in months(ex. 18mths entered as 18):")
      month_loan_dur = gets.chomp

      if loan_dur_val?(month_loan_dur)
        break
      else
        prompt("Sorry, you entered an invalid loan duration.")
      end
    end

    prompt("Confirm the following is correct (y/n):")
    prompt("Loan Amount   = $#{loan_amt}")
    prompt("APR           = #{input_apr}%")
    prompt("Loan Duration = #{month_loan_dur} months")
    confirmation = gets.chomp

    if confirmation == "y"
      break
    else
      prompt("Let's start over....")
    end
  end

  # Convert apr to monthly percentage rate
  monthly_int_rate = apr / 12

  # Calculate monthly payment
  denominator = (1 - (1 + monthly_int_rate)**(month_loan_dur.to_i * (-1)))
  monthly_payment = (loan_amt.to_i) * (monthly_int_rate / denominator)

  # Display results
  prompt("Calculating.....")
  prompt("Your monthly payment will be: $#{monthly_payment.round(2)}")

  # Ask user if you would like to perform another calculation
  prompt("Would you like to go again?")
  go_again = gets.chomp

  if go_again == "y"
    prompt("Starting over....")
  else
    break
  end
end # END main loop

prompt("Thank you for using the loan calculator, goodbye!")
