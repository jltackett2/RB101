# my_numbers = [1, 4, 3, 7, 2, 6]
#
# def double_numbers!(my_numbers)
#   counter = my_numbers.size
#
#   loop do
#     break if counter == 0
#
#     my_numbers << my_numbers.shift * 2
#     counter -= 1
#   end
#
# my_numbers
# end
#
# p double_numbers!(my_numbers)
#
# p my_numbers
#
#
# def another_way(my_numbers)
#   counter = 0
#
#   loop do
#     break if counter == my_numbers.size
#     my_numbers[counter] *= 2
#     counter += 1
#   end
#
# my_numbers
# end
#
# p another_way(my_numbers)

# def double_odd_nums(numbers)
#   counter = 0
#
#   loop do
#     break if counter == numbers.size
#
#     current_num = numbers[counter]
#     current_num *= 2 if current_num.odd?
#     numbers[counter] = current_num
#     counter += 1
#   end
#
#   numbers
# end
#
# p double_odd_nums(numbers)

# def double_odd_indices(numbers)
#   counter = 0
#
#   loop do
#     break if counter == numbers.size
#     numbers[counter] *= 2 if counter.odd?
#     counter += 1
#   end
#
#   numbers
# end
#
# p double_odd_indices(numbers)
#
# produce = {
#   'apple' => 'Fruit',
#   'carrot' => 'Vegetable',
#   'pear' => 'Fruit',
#   'broccoli' => 'Vegetable'
# }
#
#
# def general_selection(produce_hash, criteria)
#   produce_keys = produce_hash.keys
#   counter = 0
#   selected_produce = {}
#
#   loop do
#     break if counter == produce_keys.size
#
#     if criteria == produce_hash[produce_keys[counter]]
#     selected_produce[produce_keys[counter]] =
#       produce_hash[produce_keys[counter]]
#     end
#
#     counter +=1
#   end
#
#   selected_produce
# end
#
# p general_selection(produce, "Fruit")

# my_numbers = [1, 4, 3, 7, 2, 6]
#
# def multiply(number_array, multiple)
#   counter = 0
#   multiplied_array = []
#
#   loop do
#     break if counter == number_array.size
#
#
#     multiplied_array << number_array[counter] * multiple
#     counter += 1
#   end
#
#   multiplied_array
# end
#
# p multiply(my_numbers, 3)
# p my_numbers

question = 'How many times does a particular character appear in this sentence?'

def select_letter(str, letter)
  selected_letter = ""
  counter = 0

  loop do
    break if counter == str.size

    current_char = str[counter]

    if current_char == letter
      selected_letter << current_char
    end

    counter += 1
  end

  selected_letter
end

p select_letter(question, 'a').size
p select_letter(question, 't')
p select_letter(question, 'z')
