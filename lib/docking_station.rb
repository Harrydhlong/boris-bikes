# in lib/docking_station.rb

require_relative 'bike'
require_relative 'van'

class DockingStation
  DEFAULT_CAPACITY = 20

  attr_reader :capacity

  def initialize(capacity=DEFAULT_CAPACITY)
    @capacity = capacity
    $bikes = []
  end

  def self.release_broken_bike
    fail 'Bike is working' unless $bikes.last.broken?
    $bikes.pop
  end

  def release_bike
    fail 'No bikes available' if empty?
    fail 'Bike is broken' if $bikes.last.broken?
    $bikes.pop
  end

  def dock(bike)
    fail 'Docking station full' if full?
    $bikes << bike
  end

  private

  attr_reader :bikes

  def full?
    $bikes.count >= capacity
  end

  def empty?
    $bikes.empty?
  end
end