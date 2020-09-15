class Event
  attr_reader :name, :food_trucks

  def initialize(name)
    @name = name
    @food_trucks = []
  end

  def add_food_truck(truck)
    @food_trucks << truck
  end

  def food_truck_names
    @food_trucks.map do |food_truck|
      food_truck.name
    end
  end

  def food_trucks_that_sell(item)
    @food_trucks.find_all do |food_truck|
      food_truck.inventory.include?(item)
    end
  end

  def total_inventory
    result = {}
    @food_trucks.each do |food_truck|
      food_truck.inventory.each do |item, quantity|
        total_quantity = food_trucks_that_sell(item).sum do |truck_inventory|
          truck_inventory.inventory[item]
        end
        result[item] = {quantity: total_quantity, food_trucks: food_trucks_that_sell(item)}
      end
    end
    result 
  end
end
