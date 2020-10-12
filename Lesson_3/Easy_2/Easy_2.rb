# # Question 1 -----------------------------------------------------
# ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }
# p ages.include?("spot")
# p ages.key?("spot")
# p ages.member?("spot")

# # Question 2 -----------------------------------------------------
# munsters_description = "The Munsters are creepy in a good way."
# p munsters_description.swapcase!
# p munsters_description.capitalize!
# p munsters_description.downcase!
# p munsters_description.upcase!

# # Question 3 --------------------------------------------------------
# ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10 }
# additional_ages = { "Marilyn" => 22, "Spot" => 237 }
# p ages.merge!(additional_ages)

# # Question 4-------------------------------------------------------------
# advice = "Few things in life are as important as house training your pet dinosaur."
#
# p advice.include?("Dino")
# p advice.include?("thi")
# # or
# p advice.match?("Dino")
# p advice.match?("thi")

# Question 5--------------------------------------------------------------
# flintstones = ["Fred", "Barney", "Wilma", "Betty", "BamBam", "Pebbles"]
# p flintstones_alt = %w(Fred Barner Wilma Betty BamBam Pebble)

# # Question 6---------------------------------------------------------------
# flintstones_alt = %w(Fred Barner Wilma Betty BamBam Pebble)
# p flintstones_alt << "Dino"

# Question 7---------------------------------------------------------------
# p flintstones_alt.push("Dino").push("Hoppy")
# p flintstones_alt.concat(%w(Dino Hoppy))

# # Question 8---------------------------------------------------------------
# advice = "Few things in life are as important as house training your pet dinosaur."
# p advice.slice!(0, advice.index("house"))
# p advice

# # Question 9 --------------------------------------------------------------
# statement = "The Flintstones Rock!"
# count = 0
# statement.each_char{ |char| char == "t" ? count += 1 : next }
# p count
# # correct answer
# statement.count("t")

# # Question 10 ------------------------------------------------------------_
# title = "Flintstone Family Matters"
# p title.center(40)
