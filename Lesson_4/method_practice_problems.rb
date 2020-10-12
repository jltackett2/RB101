# # Number 1-------------------------------------
# [1, 2, 3].select do |num|
#   num > 5
#   'hi'
# end
# # => ["hi", "hi", "hi"]
# # WRONG, actually => [1, 2, 3]

# # Number 2--------------------------------------
# ['ant', 'bat', 'caterpillar'].count do |str|
#   str.length < 4
# end
# # when a block is given as above, it counts the number of elements
# #   yielding a true value. the above will return 2

# # Number 3--------------------------------------
# [1, 2, 3].reject do |num|
#   puts num
# end
#
# # => [1, 2, 3]

# # Number 4----------------------------------------
# ['ant', 'bear', 'cat'].each_with_object({}) do |value, hash|
#   hash[value[0]] = value
# end
# # => {"a" => "ant", "b" => "bear", "c" => "cat"}

# # Number 5----------------------------------------
# hash = { a: 'ant', b: 'bear' }
# hash.shift

# this returns => [a:, "ant"]. hash will now be { b: "bear"}

# # Number 6-----------------------------------------
# ['ant', 'bear', 'caterpillar'].pop.size
#
# # this returns => 11

# # Number 7-------------------------------------------
# [1, 2, 3].any? do |num|
#   puts num
#   num.odd?
# end
# # => true, because at 1 and 3 are odd, meaning num.odd? returns true, which makes the #any? method return true

# # Number 8-------------------------------------------
# arr = [1, 2, 3, 4, 5]
# arr.take(2)
#
# # #take() returns the first n elements from a given array. It is not destrucive to the original array. In this example, arr.take(2) would return [1, 2], and arr would remain [1, 2, 3, 4, 5]

# # Problem 9--------------------------------------------
# { a: 'ant', b: 'bear' }.map do |key, value|
#   if value.size > 3
#     value
#   end
# end
#
# # => [nil, "bear"], map returns an array filled with the returns of the running block

# Problem 10-------------------------------------------
[1, 2, 3].map do |num|
  if num > 1
    puts num
  else
    num
  end
end

# => [1,nil,nil] map creates an array with return values of block, since puts returns nil, nil is returned for the rest of the original array
