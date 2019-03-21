require './credit_cards'

puts CreditCard.new(4123456789012, 2016, 12).valid?
puts CreditCard.new(4123456789012, 2012, 12).valid?
