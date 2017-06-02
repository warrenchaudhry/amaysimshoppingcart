load "product.rb"
load "shopping_cart.rb"

ult_small = Product.new("ult_small", "Unlimited 1GB", 24.90)
ult_medium = Product.new("ult_medium", "Unlimited 2GB", 29.90)
ult_large = Product.new("ult_large", "Unlimited 5GB", 44.90)
one_gb = Product.new("1gb", "1 GB Data-pack", 9.90)

# SCENARIO 1
puts '*' * 100
puts "Scenario 1"
cart1 = ShoppingCart.new
3.times do
  cart1.add(ult_small)
end
cart1.add(ult_large)

puts "\nCart Items:\n"
puts cart1.items_summary
puts "Total Price is $#{("%.2f" % cart1.total)}\n"

# SCENARIO 2
puts '*' * 100
puts "Scenario 2"
cart2 = ShoppingCart.new
2.times do
  cart2.add(ult_small)
end

4.times do
  cart2.add(ult_large)
end

puts "\nCart Items:\n"
puts cart2.items_summary
puts "Total Price is $#{("%.2f" % cart2.total)}\n"

# SCENARIO 3
puts '*' * 100
puts "Scenario 3"
cart3 = ShoppingCart.new
cart3.add(ult_small)

2.times do
  cart3.add(ult_medium)
end

puts "\nCart Items:\n"
puts cart3.items_summary
puts "Total Price is $#{("%.2f" % cart3.total)}\n"

# SCENARIO 4
puts '*' * 100
puts "Scenario 4"
cart4 = ShoppingCart.new
cart4.add(ult_small)
cart4.add(one_gb, 'I<3AMAYSIM')

puts "\nCart Items:\n"
puts cart4.items_summary
puts "Total Price is $#{("%.2f" % cart4.total)}\n"
