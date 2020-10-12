# # Repeat Yourself-------------------------------------------------
#
# def repeat(str, number)
#   number.times { puts str }
# end
#
# repeat("Hello", 3)

# Odd---------------------------------------------------------------
# set input = integer
# output = true/false
# number is odd if number / 2 has a remainder
# therefor
# if remainder of number / 2 != 0 is true

# def is_odd?(integer)
#   integer.remainder(2) != 0
# end
#
# # test cases
# puts is_odd?(2)    # => false
# puts is_odd?(5)    # => true
# puts is_odd?(-17)  # => true
# puts is_odd?(-8)   # => false
# puts is_odd?(0)    # => false
# puts is_odd?(7)    # => true

# # List of Digits---------------------------------------------------
#
# # 1: take a positive integer and return a list of digits in that integer
#
# # 2: input: positive integer
# #   output: array of digits making up the integer
#
# # 3: algorithm
# #    a. initialize an array
# #    b. iterate over integer
# #    c. push each iteration to array
#
# def digit_list(pos_int)
#   pos_int.to_s.chars.map { |str| str.to_i }
# end
#
# # test cases
# puts digit_list(12345) == [1, 2, 3, 4, 5]     # => true
# puts digit_list(7) == [7]                     # => true
# puts digit_list(375290) == [3, 7, 5, 2, 9, 0] # => true
# puts digit_list(444) == [4, 4, 4]             # => true

# # How Many?-----------------------------------------------------------
# # given
# vehicles = [
#   'car', 'car', 'truck', 'car', 'SUV', 'truck',
#   'motorcycle', 'motorcycle', 'car', 'truck', 'suv'
# ]
# # count the number of occurences of each unique element
#
# # input: array
# # output: count of each unique element
#
# # iterate through array
# # store each element as a hash key, with value of count of that element
# # print hash
#
# def count_occurrences(vehicles)
#   count = {}
#
#   vehicles.uniq.each do |element|
#     element.downcase!
#     count[element] = vehicles.count(element)
#   end
#
#   count.each_pair { |element, count| puts "#{element} => #{count}" }
# end
#
# # test case
# count_occurrences(vehicles)
# # expected output:
#   # car => 4
#   # truck => 3
#   # suv => 2
#   # motorcycle => 2

# # Reverse It Part 1-------------------------------------------------------
# # Problem: Write a method that takes a str, and returns a new strings in reverse order
#     # input: str
#     # output: str in reverse order
#
# # Algorithm
#     # Get str
#     # split str into and array of words
#     # reverse array order
#     # convert array back into a new str
#     # print new str
#
# def reverse_sentence(str)
#   str.split.reverse.join(" ")
# end
#
# # test cases
# puts reverse_sentence('') == '' # true
# puts reverse_sentence('Hello World') == 'World Hello' # true
# puts reverse_sentence('Reverse these words') == 'words these Reverse' # true

# # Reverse It Part 2----------------------------------------------
# # input: string containing 1 or more words
# # output: string with words contraining 5 or more letters reversed
#
# # algorithm:
#   # get input string
#   # break string into an array words
#   # id words >= 5 characters
#   # reverse those words
#   # join words back into string
#
# def reverse_words(string)
#   string_array = string.split
#
#   string_array.each { |word| word.reverse! if word.size >= 5 }
#
#   string_array.join(" ")
# end
#
#
# # test cases
# puts reverse_words('Professional')          # => lanoisseforP
# puts reverse_words('Walk around the block') # => Walk dnuora the kcolb
# puts reverse_words('Launch School')         # => hcnuaL loohcS

# # Stringy Strings-----------------------------------------------
#
# #problem: write a method that takes a positive integer and returns alternating 1s and 0s starting with 1
#   #input: positive integer
#   #output: 1s and 0s ex: 6 => 101010
#
# # algorithm:
#   # set count equal to 0
#   # when count is even, print 1
#   # when count is odd, print 0
#   # end when count > input integer
#
# def stringy(int, start = 1)
#   numbers = []
#
#   int.times do |index|
#     if start == 1
#       number = index.even? ? 1 : 0
#       numbers << number
#     elsif start == 0
#       number = index.even? ? 1 : 0
#       numbers << number
#     end
#   end
#   numbers.join
# end
#
# # test cases:
# puts stringy(6) #== '101010'
# puts stringy(9, 0) #== '101010101'

# # Array Average------------------------------------------------
# # problem: take an array of positive integers and return an average of all the number in the array.
#   # intput: non-empty array with positive integers
#   # output: average of all integers
#
# # algorithm:
#   # average of [1, 6] = (1 + 6) / 2 = 3
#   # average = sum of numbers / number of numbers
#   # sum all numbers in array
#   # divide sum by count of numbers in array
#   # return the average
#
# def average(array)
#   array.sum.to_f / array.size
# end
#
# # test cases
# puts average([1, 6])
# puts average([1, 5, 87, 45, 8, 8])
# puts average([9, 47, 23, 95, 16, 52])

# # Sum of digits------------------------------------------------
# def sum(int)
#   int.to_s.chars.sum(&:to_i)
# end
#
# puts sum(23) #== 5
# puts sum(496) #== 19
# puts sum(123_456_789) #== 45

# # Whats My Bonus?----------------------------------------------
# # problem: write a method that takes a salaray and boolean and return your bonus
#     #input: salary, bonus = true/false
#     #output: bonus amount
#
# # algorithm:
#   # when true, bonus = salary / 2
#   # when false, bonus = 0
#
# def calculate_bonus(salary, bonus)
#   bonus ? (salary / 2) : 0
# end
#
# puts calculate_bonus(2800, true) == 1400
# puts calculate_bonus(1000, false) == 0
# puts calculate_bonus(50000, true) == 25000

# 
