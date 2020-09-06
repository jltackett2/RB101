# # Diving deeper in to precedence from Lesson 2 of Ruby101
#
 array = [1, 2, 3]
# array.map { |num| num + 1 } #=> [2, 3, 4]
#
# #versus
#
# p array.map { |num| num + 1 } # prints [2, 3, 4]
#                               # => [2, 3, 4]
#
# #versus
#
# array.map do |num|
#   num + 1
# end                           # => [2, 3, 4]
#
# #versus
#
# p array.map do |num|
#   num + 1
# end                           #  outputs #<Enumerator: [1, 2, 3]:map>
#                               #  => #<Enumerator: [1, 2, 3]:map>
# #versus
#
# p(array.map { |num| num + 1}) # prints [2, 3, 4]
#                               # => [2, 3, 4]

mapped_array = array.map { |num| num + 1 }

mapped_array.tap { |value| p value }
