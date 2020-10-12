p [2, 5, 4, 3, 1].sort

selected =  [{ a: 'ant', b: 'elephant' }, { c: 'cat' }].select do |hash|
  hash.any? do |key, value|
    value[0] == key.to_s
  end
end
# => [{ :c => "cat" }]
p selected
