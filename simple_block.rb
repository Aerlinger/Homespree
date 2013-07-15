a = "This is defined on global scope (KERNEL)"

def sandwich(&block)
  puts "This is first"
  puts yield("tomato")
  puts "This is last"
end

puts "WHO AM I?"
puts self

sandwich do |params|
  # This is called a 'closure'
  "This is in the sandwich #{params}  #{a}"
  puts "In the block:"
  puts self
end
