#-------------------  EASY 3-------------------------------------------

# # Searching 101 -------------------------------------------------------
#
# def msg(string)
#   puts "==> #{string}"
# end
#
# order = %w(1st 2nd 3rd 4th 5th last)
# numbers = []
#
# order.each do |place|
#   msg("Enter the #{place} number:")
#     numbers << gets.to_i
# end
#
# last = numbers.pop
# included = "The number #{last} appears in #{numbers}"
# not_included = "The numbers #{last} does not appear in #{numbers}"
#
# numbers.include?(last) ? (puts included) : (puts not_included)


# # Arithmetic Integer ---------------------------------------------------
# def msg(string)
#   puts "==> #{string}"
# end
#
# def math(num1, num2)
#   msg("#{num1} + #{num2} = #{num1 + num2}")
#   msg("#{num1} - #{num2} = #{num1 - num2}")
#   msg("#{num1} * #{num2} = #{num1 * num2}")
#   msg("#{num1} / #{num2} = #{num1 / num2}")
#   msg("#{num1} % #{num2} = #{num1 % num2}")
#   msg("#{num1} ** #{num2} = #{num1 ** num2}")
# end
#
# msg("Enter 1st number:")
# num1 = gets.to_f
# num2 = ''
#
# loop do
#   msg("Enter 2nd number")
#   num2 = gets.to_f
#   break unless num2 == 0
#   msg("Zero is not a valid 2nd number.")
# end
#
# math(num1, num2)


# # Counting the number of character -----------------------------------------
# puts "Please write word or multiple words:"
# words = gets.chomp
#
# characters = words.delete(" ").size
#
# puts "There are #{characters} characters in '#{words}'."


# # Multiplying Two Numbers ---------------------------------------------------
def multiply(num_1, num_2)
  num_1 * num_2
end

# p multiply([1, 2, 3, 4, 5], 3)


# Squaring an Argument -----------------------------------------------------
# uncomment Multiplying two numbers above
def power_to_the_n(num, power = 2)
  num_1, num_2 = num, num
  count = 1

  until count == power
    count +=1
    answer = multiply(num_1, num_2)
    num_1 = answer
  end
  answer
end

p power_to_the_n(2, 3)
p power_to_the_n(-8)
p power_to_the_n(2, 4)
