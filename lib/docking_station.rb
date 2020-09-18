# in lib/docking_station.rb

require_relative 'bike'

class DockingStation
  def initialize
    @bikes = []
  end

  def release_bike
    fail 'No bikes available' if @bikes.empty?
    @bikes.pop
  end

  def dock(bike)
    # Use an instance variable to store the bike
    # in the 'state' of this instance
    fail 'Docking station full' if @bikes.count >= 20
    @bikes << bike
  end

  # Let's add to our #bike method to return the bike we docked
  attr_reader :bike
end