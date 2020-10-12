# # Problem 1--------------------------------------------------
# flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]
#
# flintstones_hash = Hash.new
# flintstones.each_with_index do |name, index|
#   flintstones_hash[name] = index
# end
#
# p flintstones_hash

# # Problem 2---------------------------------------------------
# ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }
#
# ages_values = []
#
# ages.each_value { |age| ages_values << age }
#
# sum_ages = ages_values.sum
#
# puts sum_ages
# # or
#
# ages_sum = ages.sum { |k, v| v }
#
# puts ages_sum

# # Problem 3------------------------------------------------------
# ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }
#
# ages_under_100 = ages.filter { |k, v| v < 100 }

# # Problem 4------------------------------------------------------
# ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }
#
# p ages.values.min

# # Problem 5--------------------------------------------------------
# flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
#
# p flintstones.find_index { |name| name.include?("Be") }
#
# # COuld return wrong answer for a name like HoBe

# # Problem 6------------------------------------------------------
# flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
#
# flintstones.map! { |name| name[0..2] }
#
# p flintstones

# # Problem 7-----------------------------------------------------
# statement = "The Flintstones Rock"
#
# hash = {}
#
# statement.each_char do |char|
#
#   if char == " "
#     next
#   elsif hash.include?(char)
#     hash[char] += 1
#   else
#     hash[char] = 1
#   end
# end
#
# p hash

# # Problem 8--------------------------------------------------------
# # case a
# numbers = [1, 2, 3, 4]
# numbers.each do |number|
#   p number
#   numbers.shift(1)
# end
# p numbers
# # this will print 1, 3
# # numbers = []
#
# # Case b
# numbers = [1, 2, 3, 4]
# numbers.each do |number|
#   p number
#   numbers.pop(1)
# end
# # this will print 1, 2

# # Problem 9-----------------------------------------------------
# words = "the flintstones rock"
# # expected words = "The Flintstones Rock"
#
#
# p words.split.map { |word| word.capitalize }.join(" ")

# Problem 10------------------------------------------------------
munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

# munsters.each_value do |hash|
#   age = hash["age"]
#
#   if age >= 0 && age <= 17
#     hash["age_group"] = "kid"
#   elsif age >= 18 && age <= 64
#     hash["age_group"] = "adult"
#   else age > 65
#     hash["age_group"] = "senior"
#   end
# end

# or

munsters.each_value do |hash|
  case hash["age"]
  when 0..18
    hash["age_group"] = "kid"
  when 18..65
    hash["age_group"] = "adult"
  else
    hash["age_group"] = "senior"
  end
end

p munsters
