# Answers to questions from RB101 Lesson 3 practice problems

# # question 1------------------------------------------------
# # what would you expect the following to print
# numbers = [1, 2, 2, 3]
# numbers.uniq
#
# puts numbers
# # i would expect to print:  1, 2, 2, 3
# # CORRECT!

# #question 2-------------------------------------------------
#   # 1: != is a comparison operator
#        # example:
#                   car_status = "broken"
#                   if car_status != "broken"
#                     puts "I'm taking the car"
#                   else
#                     puts "I'm taking the bus"
#                   end
#                   # => "I'm taking the bus"
#   # 2: !user_name
#       # example:
#       user_name = true
#       p !user_name
#       # => false
#
#   # 3: use ! after something
#     numbers = [1, 2, 2, 3, 3, 4]
#     numbers.uniq!
#     p numbers
#     # => [1, 2, 3, 4]
#
#   # 4: put ? before something
#   "".empty? ? (puts "yes") : (puts "no")
#
#
#   #5: puts ? after something
#     def yes?(string)
#       string == "yes"
#     end
#
#     p yes?("yes")
#     # => true
#
#   #6: put !! in front of something
#     user_name = "jordan"
#     p !!user_name
#     # => true

# # Question 3-------------------------------------------------
# advice = "Few things in life are as important as house training your pet dinosaur."
# advice.gsub!("important", "urgent")
# puts advice

# # Question 4---------------------------------------------------
# numbers = [1, 2, 3, 4, 5]
#
# numbers.delete_at(1) # deletes at 1 index and => 2
# p numbers
#
# numbers = [1, 2, 3, 4, 5]
# puts numbers.delete(1) # deletes 1... => 1
# p numbers

# # Question 5-----------------------------------------------------
#   # determine if 42 lies between 10 and 100
#
#   p (10..100).include?(42)

# # Question 5-----------------------------------------------------
# # find two ways to put "four score" in front of below:
# famous_words = "seven years ago..."
#
# famous_words_1 = "Four score and " + famous_words
# puts famous_words_1
#
# famous_words_2 = "Four score and " << famous_words
# puts famous_words_2
#
# famous_words_3 = "Four score and #{famous_words}"
# puts famous_words_3
# # could also use #prepend
#
# #Question 6--------------------------------------------------
# flintstones = ["Fred", "Wilma"]
# flintstones << ["Barney", "Betty"]
# flintstones << ["BamBam", "Pebbles"]
# p flintstones
#
# p flintstones.flatten # use ! to mutate flintstones

# # Question 7-------------------------------------------------------
# flintstones = { "Fred" => 0, "Wilma" => 1, "Barney" => 2, "Betty" => 3, "BamBam" => 4, "Pebbles" => 5 }
#
# barney_array = [flintstones["Barney"], flintstones.key(2)]
# p barney_array
# # or
# barney_array = flintstones.assoc("Barney")
# p barney_array
