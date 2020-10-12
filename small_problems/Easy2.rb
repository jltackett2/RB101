# # How old is Teddy? ----------------------------------------------
# # Problem: Build a program that randomy generates a age for Teddy between 20 and 200
#
# def teddy_age
#   puts "Please enter a name:"
#   name = gets.chomp
#   name = "Teddy" if name.empty?
#   puts "#{name} is #{rand(20..200)} years old!"
# end
#
# teddy_age

# # How big is the room? -------------------------------------------
# # Problem: build a program that returns the square meter/feet of room given length and width from user
#   # input: length/width in meters
#   # output: square meters, square feet
#
# # algorithm:
#   # get length from user
#   # get width from user
#   # multiply length times width
#   # convert to square feet
# def square_room(length, width)
#   square_feet = (length * width).round(2)
#   square_inches = (square_feet * 144).round(2)
#   square_centimeters = (square_feet * 929.0304).round(2)
#   puts "The area of the room is #{square_feet} square_feet, #{square_inches} square_inches, #{square_centimeters} square centimeters."
# end
#
# puts "Please enter length of room in feet:"
# length = gets.chomp.to_f
#
# puts "Please enter the width of the room in feet:"
# width = gets.chomp.to_f
# square_room(length, width)

# # Tip Calculator -------------------------------------------------
# # Problem: Write a simple tip calculator
#   # input: bill, tip percentage
#   # output: tip amount, total bill
#
# # algorithm:
#   # get bill amount
#   # get bill percentage
#   # convert bill percentage to percent (15/100 = .15)
#   # multipley bill by percentage to get tip amount
#   # add bill and tip amount to get total bill
#
# def tip_calc(bill, percent)
#   tip = (bill * percent).round(2)
#   total_bill = bill + tip
#   puts "The tip is:   $#{sprintf("%0.2f", tip)}"
#   puts "The total is: $#{sprintf("%0.2f",total_bill)}"
# end
#
# puts "Please enter bill amount:"
# bill = gets.chomp.to_f
#
# puts "Please enter tip percentage:"
# percent = gets.chomp.to_f / 100
#
# tip_calc(bill, percent)

# # When will I retire?
# # Problem: write a program that aske the user their age and ideal retirement date and returns their retirement year and how many years they have left to work
#   # input: age, age of retirement
#   # output: retirement year, number of years left to work
#
# # algorithm:
#   # get age from user
#   # get age at retirement from user
#   # set current year to 2020
#   # number of years until retirement = retirement age - current age
#   # retirement year = current year + number of year until retirement
#
# def retirement_math(age, retirement_age)
#   current_year = Time.now.year
#   years_to_retirement = retirement_age - age
#   retirement_year = current_year + years_to_retirement
#
#   puts "It's #{current_year}. You will retire in #{retirement_year}."
#   puts "You have only #{years_to_retirement} to go!"
# end
#
# puts "What is your age?"
# age = gets.to_i
#
# puts "At what age would you like to retire?"
# retirement_age = gets.to_i
#
# retirement_math(age, retirement_age)

# # Greeting a user -------------------------------------------------
# # problem: write a program that ask for a users name and screams back at them if ! is included with their name
#   # input: name
#   # output: greeting if name
#   #         GREETING! if name!
#
# #Algorithm:
#   # get name
#   # split name into array of chars
#   # if array[-1] == !
#       #return screaming
#   # else return greeting
#
# def screaming?(name)
#   name[-1] == "!"
# end
#
# def greeting(name)
#   yell = "HELLO #{name.chop.upcase}. WHY ARE WE SCREAMING?!?!"
#   greet = "Hello #{name}."
#   screaming?(name) ? (puts yell) : (puts greet)
# end
#
# puts "What is your name?"
# name = gets.chomp
#
# greeting(name)

# # Odd Numbers-------------------------------------------------
# # problem: print all odd numbers 1 to 99
#   # input: none
#   # output: all odd numbers 1..99 on seperate line
#
# # algorithm:
#   # set num = 1
#   # increment numb by 2 and print
#   # stop when num > 99
#
# # num = 1
# # until num > 99 do
# #   puts num
# #   num += 2
# # end
#
# 1.upto(99) { |i| puts i if i.odd? }

# # Even numbers -------------------------------------------------
# (1..99).step { |i| puts i if i.even? }

# # Sum or Product of Consecutive integers -------------------------
# # problem: write a program that ask the user for an integer and sum or product. return sum or product between 1 and given integer
#   # intput: integer, sum or product
#   # output: sum or 1..integer if sum
#           # product of 1..integer if product
#
# # algorithm:
#   # get integer
#   # get sum or product
#     # if sum:
#       # (1..int).sum
#     # if product
#       # num = 1
#       # (1..int).each num *= int
#
# def one_to_num_sum(number)
#     sum = (1..number.to_i).inject(:+)
#     puts "The sum of integers between 1 and #{number} = #{sum}."
# end
#
# def one_to_num_product(number)
#     product = (1..number.to_i).inject(:*)
#     puts "The product of integers between 1 and #{number} = #{product}."
# end
#
# number = ""
#
# loop do
#   puts "Please enter an integer greater than 0:"
#   number = gets.chomp
#
#   break if number == number.to_i.to_s
#   puts "Sorry, invalid input."
# end
#
# loop do
#   puts "Enter 's' to compute sum, 'p' to compute the product."
#   computation = gets.chomp
#
#   if computation == "s"
#     one_to_num_sum(number)
#     break
#   elsif computation == "p"
#     one_to_num_product(number)
#     break
#   else
#     puts "Sorry invalid input. "
#   end
# end
#
# puts "Thank you for using this program!"

# # String Assignment --------------------------------------------
# name = 'Bob'
# save_name = name
# name.upcase!
# puts name, save_name
#
# # this will print "BOB", "BOB"
# # upcase! mutates the caller, in this case name.. on line 196 we told save name to point to name, therefor, both point to "BOB"

# Mutation -----------------------------------------------------
# What will the following print?
array1 = %w(Moe Larry Curly Shemp Harpo Chico Groucho Zeppo)
array2 = []
array1.each { |value| array2 << value }
array1.each { |value| value.upcase! if value.start_with?('C', 'S') }
puts array2

# This will print Moe Larry Curly Shemp Harpo Chico Groucho Zeppo
