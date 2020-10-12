# 1 -------------------------------------------------------

# arr = %w(10 11 9 7 8)
# p arr.sort {|a, b| b.to_i <=> a.to_i}

# 2 -------------------------------------------------------

# books = [
#   {title: 'One Hundred Years of Solitude', author: 'Gabriel Garcia Marquez', published: '1967'},
#   {title: 'The Great Gatsby', author: 'F. Scott Fitzgerald', published: '1925'},
#   {title: 'War and Peace', author: 'Leo Tolstoy', published: '1869'},
#   {title: 'Ulysses', author: 'James Joyce', published: '1922'}
# ]
# def sort_published_date(books)
#   books.sort_by do |book|
#     book[:published]
#   end
# end
#
# puts sort_published_date(books)

# 3 ----------------------------------------------------------
# reference g for each array
# arr1 = ['a', 'b', ['c', ['d', 'e', 'f', 'g']]]
#
# arr2 = [{first: ['a', 'b', 'c'], second: ['d', 'e', 'f']}, {third: ['g', 'h', 'i']}]
#
# arr3 = [['abc'], ['def'], {third: ['ghi']}]
#
# hsh1 = {'a' => ['d', 'e'], 'b' => ['f', 'g'], 'c' => ['h', 'i']}
#
# hsh2 = {first: {'d' => 3}, second: {'e' => 2, 'f' => 1}, third: {'g' => 0}}
#
# p arr1[2][1][3]
# p arr2[1][:third][0]
# p arr3[2][:third][0][0]
# p hsh1["b"][1]
# p hsh2[:third].key(0)

# 4 -----------------------------------------------------------
# change 3 to 4

# arr1 = [1, [2, 3], 4]
#
# arr2 = [{a: 1}, {b: 2, c: [7, 6, 5], d: 4}, 3]
#
# hsh1 = {first: [1, 2, [3]]}
#
# hsh2 = {['a'] => {a: ['1', :two, 3], b: 4}, 'b' => 5}
#
# arr1[1][1] = 4
# arr2[2] = 4
# hsh1[:first][2][0] = 4
# hsh2[["a"]][:a][2] = 4
#
# p arr1
# p arr2
# p hsh1
# p hsh2

# 5 -----------------------------------------------------------
munsters = {
  "Herman"  => { "age" => 32,   "gender" => "male"    },
  "Lily"    => { "age" => 30,   "gender" => "female"  },
  "Grandpa" => { "age" => 402,  "gender" => "male"    },
  "Eddie"   => { "age" => 10,   "gender" => "male"    },
  "Marilyn" => { "age" => 23,   "gender" => "female"  }
}

# males = munsters.select do |k, v|
#   v["gender"] == "male"
# end
# male_ages = []
#  males.each do |k,v|
#   male_ages << v.fetch("age")
# end
#
# total_age = male_ages.sum
# p total_age

# refactored
# male_ages = []
# munsters.each do |k,v|
#   male_ages << v.fetch("age") if v["gender"] == "male"
# end
#
# p male_ages.sum

# 6 ----------------------------------------------------------

# munsters.each do |k, v|
#   puts "#{k} is a #{v["age"]}-year-old #{v["gender"]}."
# end

# 7 ----------------------------------------------------------

# a = 2
# b = [5, 8]
# arr = [a, b]
#
# arr[0] += 2
# arr[1][0] -= a
# a => 2
# b => [3, 8]

# 8 ---------------------------------------------------------

# hsh = {first: ['the', 'quick'],
#       second: ['brown', 'fox'],
#       third: ['jumped'],
#       fourth: ['over', 'the', 'lazy', 'dog']}
#
# vowels = %w(a e i o u A E I O U)
# hsh.each_value do |words|
#   words.each do |word|
#     word.chars.each do |char|
#       puts char if vowels.include?(char)
#     end
#   end
# end

# 9 ---------------------------------------------------------

# arr = [['b', 'c', 'a'], [2, 1, 3], ['blue', 'black', 'green']]
#
# sort_arr = arr.map do |sub_arr|
#             sub_arr.sort { |a, b| b <=> a }
#            end
#
# p sort_arr

# 10 --------------------------------------------------------

# hsh_arr = [{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}]
#
# new_hsh_arr = hsh_arr.map do |hsh|
#                 sub_hsh = {}
#                 hsh.each do |k, v|
#                   sub_hsh[k] = (v + 1)
#                 end
#                 sub_hsh
#               end
#
# p new_hsh_arr
# p hsh_arr

# 11 --------------------------------------------------------

# arr = [[2], [3, 5, 7], [9], [11, 13, 15]]
#
# three_multiples = arr.map do |sub_arr|
#                     sub_arr.select {|element| element % 3 == 0}
#                   end
#
# p three_multiples

# 12 --------------------------------------------------------

# arr = [[:a, 1],
#        ['b', 'two'],
#        ['sea', {c: 3}],
#        [{a: 1, b: 2, c: 3, d: 4}, 'D']]
# # expected return value: {:a=>1, "b"=>"two", "sea"=>{:c=>3}, {:a=>1, :b=>2, :c=>3, :d=>4}=>"D"}
#
# hsh = {}
# arr.each do |sub_arr|
#   hsh[sub_arr[0]] = sub_arr[1]
# end
#
# p hsh

# 13 --------------------------------------------------------

# arr = [[1, 6, 7], [1, 4, 9], [1, 8, 3]]
#
# new_arr = arr.sort_by do |sub_arr|
#             sub_arr.select do |num|
#               num.odd?
#             end
#           end
#
# p new_arr

# 14 --------------------------------------------------------

# hsh = {
#   'grape' => {type: 'fruit', colors: ['red', 'green'], size: 'small'},
#   'carrot' => {type: 'vegetable', colors: ['orange'], size: 'medium'},
#   'apple' => {type: 'fruit', colors: ['red', 'green'], size: 'medium'},
#   'apricot' => {type: 'fruit', colors: ['orange'], size: 'medium'},
#   'marrow' => {type: 'vegetable', colors: ['green'], size: 'large'},
# }
#
# data_arr = []
#
# hsh.each_value do |data|
#   if data[:type] == "fruit"
#     data_arr << data[:colors].map { |color| color.capitalize }
#   elsif data[:type] == "vegetable"
#     data_arr << data[:size].upcase
#   end
# end
#
# p data_arr

# 15 --------------------------------------------------------
# arr = [{a: [1, 2, 3]}, {b: [2, 4, 6], c: [3, 6], d: [4]}, {e: [8], f: [6, 10]}]
#
#
# arr_even = arr.select do |hsh|
#             hsh.all? do |_, v|
#               v.all? do |num|
#                 num.even?
#               end
#             end
#           end
#
# p arr_even

# 16 -------------------------------------------------------
HEX = %w(0 1 2 3 4 5 6 7 8 9 a b c d e f)

def uuid_gen(hex)
  uuid = []
  count = 0
  until count == 32
    uuid << HEX.sample
    count += 1
  end
  uuid.insert(8, "-")
  uuid.insert(13, "-")
  uuid.insert(18, "-")
  uuid.insert(23, "-")
  uuid.join
end

p uuid_gen(HEX)
