#Bad question: something easily tested
#Can constant be accessed outside a method?
NUMBER = [1, 2, 3]

def test
  puts NUMBER.inspect
end

test
#Good question:
#Why can a constant be accessible outside a method, but
#a local variable can't

NUMBERS = [1, 2, 3]
arr = _[1, 2, 3]

def test
  puts NUMBERS.inspect
  puts arr.inspect
end

test
