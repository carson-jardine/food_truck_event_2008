require 'minitest/autorun'
require 'minitest/pride'
require './lib/item'
require './lib/food_truck'

class FoodTruckTest < Minitest::Test
  def setup
    @item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})
    @item2 = Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})
    @food_truck = FoodTruck.new("Rocky Mountain Pies")
  end

  def test_it_exists
    assert_instance_of FoodTruck, @food_truck
  end

  def test_it_has_a_name
    assert_equal "Rocky Mountain Pies", @food_truck.name
  end

  def test_inventory_begins_empty
    assert_equal ({}), @food_truck.inventory
  end

  def test_it_can_check_stock
    assert_equal 0, @food_truck.check_stock(@item1)

    @food_truck.stock(@item1, 30)
    assert_equal ({@item1 => 30}), @food_truck.inventory
    assert_equal 30, @food_truck.check_stock(@item1)
  end

end


# @food_truck.inventory
#=> {#<Item:0x007f9c56740d48...> => 30}

# @food_truck.check_stock(@item1)
#=> 30

# @food_truck.stock(@item1, 25)

# @food_truck.check_stock(@item1)
#=> 55

# @food_truck.stock(item2, 12)

# @food_truck.inventory
#=> {#<Item:0x007f9c56740d48...> => 55, #<Item:0x007f9c565c0ce8...> => 12}
