# #Question 1---------------------------------------------------------
# string = "The Flintstones Rock!"
# 10.times { |num| puts string.rjust(string.length + num) }

# # Question 2----------------------------------------------------------
# # puts "the value of 40 + 2 is " + (40 + 2) => error
# # the integer needs to be converted to a string!
# puts "the value of 40 + 2 is " + (40 + 2).to_s

# # Question 3----------------------------------------------------------
# def factors(number)
#   divisor = number
#   factors = []
#   while divisor > 0 do
#     factors << number / divisor if number % divisor == 0
#     # above adds number to factors if remainder == 0, which makes it a factor
#     divisor -= 1
#   end
#   factors # so method will return factors
# end
#
# puts factors(10)

# Question 4------------------------------------------------------------
# i would use the first implementation. << adds the element to the end
# of the array so we are guranteed that buffers are added oldest to
# newest

# Question 5---------------------------------------------------------
# limit is outside of the scope of the method, is not passed into the
# method as an argument, so therefore cannot be accessed inside the method

# Question 6-------------------------------------------------------------
# 34

# Question 7------------------------------------------------------------
# yes, it will be changed

# Question 8---------------------------------------------------------
# puts rps(rps(rps("rock", "paper"), rps("rock", "scissors")), "rock")
# puts rps(rps(rps("rock", "paper"), "rock")), "rock")
# puts rps(rps("paper", "rock")), "Rock")
# puts rps(paper, rock)
# paper

#Question 9-------------------------------------------------------------
def foo(param = "no")
  "yes"
end

def bar(param = "no")
  param == "no" ? "yes" : "no"
end
