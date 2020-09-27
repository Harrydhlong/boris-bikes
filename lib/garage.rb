# in lib/garage.rb

require_relative 'bike'
require_relative 'van'
require_relative 'bike_container'

class Garage
  include BikeContainer

  def release_bike
    fail 'No bikes available' if empty?
    @bikes.pop
  end

  def dock(bike)
    add_bike bike
  end

  def repair_bike
    Bike.repair
  end
end