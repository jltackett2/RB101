
# LaunchSchool walkthrough-------------------------------------
# ask the user for numbers
# ask the user for operation
# perform the operation
# output the result
require "yaml"
MESSAGES = YAML.load_file "calc_msgs.yml"

def prompt(message)
  puts("=> #{message}")
end

# Bonus Feature 1, valid_integer? validates num is an integer, including 0.
# => true/false
def valid_integer?(num)
  num.to_i.to_s == num
end

# valid_float? validates num is a float => true/false
def valid_float?(num)
  num.to_f.to_s == num
end

# valid_fraction? validates thats user entered a fraction
# => true / false
def valid_fraction?(num)
  if num.include?("/")
    num_array = []
    num_array = num.split("/")
    if num_array.size == 2
      valid_integer?(num_array[0]) && valid_integer?(num_array[1]) && num_array[1] != "0"
    else
      return false
    end
  else
    return false
  end
end

def fraction_to_float(num)
  num_array = []
  num_array = num.split("/")
  num_array[0].to_f / num_array[1].to_f
end

# Bonus Feature 2, validates that input is integer/float/fraction
# accounts for fractions from user i.e: "1/2"
def valid_number?(num)
  valid_integer?(num) || valid_float?(num) || (valid_fraction?(num) != false)
end

def operator_message(operator)
  word = case operator.downcase
  when "add"
    "Adding"
  when "subtract"
    "Subtracting"
  when "multiply"
    "Multiplying"
  when "divide"
    "Dividing"
  end
  word
end

def invalid_num_error
  invalid_num_msg = MESSAGES["invalid_num_msg"]
  prompt(invalid_num_msg)
end

prompt(MESSAGES["welcome"])
prompt(MESSAGES["name_entry"])

name = ''
loop do # user name loop
  name = gets.chomp.strip

  if name.empty?
    prompt(MESSAGES["valid_name"])
  else
    break
  end
end

prompt("Welcome #{name}!")

loop do # main loop
  num1 = ''
  loop do # num1 loop
    prompt("Whats the first number?")
    num1 = gets.chomp

    if valid_number?(num1)
      if valid_fraction?(num1)
        num1 = fraction_to_float(num1)
      else
        break
      end
      break
    else
      invalid_num_error
    end
  end

  num2 = ''
  loop do # num2 loop
    prompt("Whats the second number?")
    num2 = gets.chomp

    if valid_number?(num2)
      if valid_fraction?(num2)
        num2 = fraction_to_float(num2)
        p num2
      else
        break
      end
      break
    else
      invalid_num_error
    end
  end

  prompt(MESSAGES["operator_selection"])

  operator = ''

  loop do # operator validation loop
    operator = gets.chomp.downcase

    if %w(add subtract multiply divide).include?(operator)
      break
    else
      prompt(MESSAGES["invalid_operator"])
    end
  end

  prompt("#{operator_message(operator)} the two numbers...")

  result = case operator
           when "add"
             num1.to_f + num2.to_f
           when "subtract"
             num1.to_f - num2.to_f
           when "multiply"
             num1.to_f * num2.to_f
           when "divide"
             if num2 == "0" || num2 == 0
               "Sorry, division by zero is infinite."
             else
               num1.to_f / num2.to_f
             end
           end

  prompt("The result is: #{result}")

  prompt(MESSAGES["go_again?"])
  answer = gets.chomp
  break unless answer.downcase.start_with?("y")
end

prompt(MESSAGES["goodbye"])
