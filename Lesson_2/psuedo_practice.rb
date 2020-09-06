# #-----------------Number 1--------------------------------------
#   # Write a method that returns the sum of two integers
#   #
#   # START
#   #
#   # Given two numbers num_1 and num_2
#   #
#   # def method adder that takes num_1 and num_2
#   # set answer = 0
#   # set answer = num_1 + num_2
#   #
#   # END
# def adder(num_1, num_2)
#   answer = 0
#   answer = num_1 + num_2
# end
#
# #test: 2, 3 => 5
# puts adder(2, 3)

# #---------------Number 2------------------------------------------
# # Write a method that takes an array of string and returns a string-
# # that is concatenated together
#
# # START
#
# # Given an array of strings called string_array
#
# # Set variable string = ""
#
# #iterate over string_array for each sub_string
# #set string += sub_string
#
# #End
# string_array = ["Hello", "World"]
#
# string = ""
#
# string_array.each do |sub_string|
#   string += " " + sub_string
# end
#
# #test
# puts string

#--------------------Number 3---------------------------------
#write a method that takes an array of integers and returns -
# a new array with every other element

#START

#Given an array of integers = given_array

#Set iteration_num = 0
#Set every_other_integer = empty array

#while iteration_num is less <= length of given_array
  #iterate over given_array for each integer
    #if int_num is even or zero
      #add integer to every_other_integer
      #increment iteration_num by 1
    #otherwise
      #increment iteration_num by 1

#END

given_array = [1, 2, 3, 4, 5]

iteration_num = 0

every_other_integer = []

given_array.each do |integer|
  if iteration_num.even? || iteration_num == 0
    every_other_integer << integer
    iteration_num += 1
  else
    iteration_num += 1
  end
end

#test => [1, 3, 5]
p every_other_integer
