# in lib/docking_station.rb

require_relative 'bike'

class DockingStation
  def release_bike
    Bike.new
  end
end