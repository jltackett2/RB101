# Question 1---------------------------------------------------
# you get a nil

# # Question 2---------------------------------------------------
# greetings = { a: 'hi' }
# informal_greeting = greetings[:a]
# informal_greeting << ' there'
#
# puts informal_greeting  #  => "hi there"
# puts greetings # => { a: 'hi there' }

# Question 3-----------------------------------------------------
# #part A---
# def mess_with_vars(one, two, three)
#   one = two
#   two = three
#   three = one
# end
#
# one = "one"
# two = "two"
# three = "three"
#
# mess_with_vars(one, two, three)
#
# puts "one is: #{one}" # => "one"
# puts "two is: #{two}" # => "two"
# puts "three is: #{three}"# => "three"

# # Part B---
# def mess_with_vars(one, two, three)
#   one = "two"
#   two = "three"
#   three = "one"
# end
#
# one = "one"
# two = "two"
# three = "three"
#
# mess_with_vars(one, two, three)
#
# puts "one is: #{one}" # => "one"
# puts "two is: #{two}" # => "two"
# puts "three is: #{three}" # => "three"

# # Part C---
# def mess_with_vars(one, two, three)
#   one.gsub!("one","two")
#   two.gsub!("two","three")
#   three.gsub!("three","one")
# end
#
# one = "one"
# two = "two"
# three = "three"
#
# mess_with_vars(one, two, three)
#
# puts "one is: #{one}" # => "two"
# puts "two is: #{two}" # => "three"
# puts "three is: #{three}" # => "onei"

# Question 4---------------------------------------------------
def dot_separated_ip_address?(input_string)
  dot_separated_words = input_string.split(".")
  return false unless dot_seperated_words.size == 4

  while dot_separated_words.size > 0 do
    word = dot_separated_words.pop
    return false unless is_an_ip_number?(word)
  end

  true
end
