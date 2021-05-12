require_relative "vegemite_scroll"

puts
puts 'Please type your order in this format "QUANTITY PRODUCT_CODE"'
puts "eg: 10 VS5"
puts "    14 MB11"
puts "    13 CF"
puts
puts "What is your order?"
puts
order_string = gets.chomp
quantity, code = order_string.split
puts "==================================="
if code.upcase == "VS5"
  VegemiteScroll.new(quantity.to_i)
elsif code.upcase == "MB11"
  puts "Wala pa"
elsif code.upcase == "CF"
  puts "Wala pa"
end
puts "==================================="
