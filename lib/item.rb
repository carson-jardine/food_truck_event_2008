class Item
  attr_reader :name
  def initialize(attributes)
    @name = attributes[:name]
    @price = attributes[:price]
  end

  def price
    @price.delete('$').to_f
  end
end
