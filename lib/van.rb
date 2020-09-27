# in lib/van.rb

require_relative 'bike'
require_relative 'docking_station'
require_relative 'bike_container'

class Van
  include BikeContainer

  def release_bike
    fail 'No bikes available' if empty?
    @bikes.pop
  end

  def dock(bike)
    add_bike bike
  end
end