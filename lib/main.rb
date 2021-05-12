require_relative "./bakery"

# Initialize the Bakery
Bakery.new()

puts
puts 'Please type your order in this format "QUANTITY PRODUCT_CODE"'
puts "eg: 10 VS5"
puts "    10 MB11"
puts "    10 CF"
puts
puts "What is your order?"
puts 
order = gets.chomp

puts "==================================="
Bakery.order(order)
puts "==================================="


