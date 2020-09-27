# in lib/docking_station.rb

require_relative 'bike'
require_relative 'van'
require_relative 'bike_container'

class DockingStation
  include BikeContainer

  def release_broken_bike
    fail 'Bike is working' unless @bikes.last.broken?
    @bikes.pop
  end

  def release_bike
    fail 'No bikes available' if empty?
    fail 'Bike is broken' if @bikes.last.broken?
    @bikes.pop
  end

  def dock(bike)
    add_bike bike
  end
end