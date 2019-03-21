# To start, we'll define the CreditCardType class, which has a name and pattern.
class CreditCardType
  attr_reader :name, :pattern
  
  def initialize(name, pattern)
    @name, @pattern = name, pattern
  end
  
  def match(number)
    number.to_s.match(@pattern)
  end
end
