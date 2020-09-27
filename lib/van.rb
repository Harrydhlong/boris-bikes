# in lib/van.rb

require_relative 'bike'
require_relative 'docking_station'

class Van
  DEFAULT_CAPACITY = 20

  attr_reader :capacity

  def initialize(capacity=DEFAULT_CAPACITY)
    @capacity = capacity
    @bikes = []
  end

  def release_bike
    fail 'No bikes available' if empty?
    @bikes.pop
  end

  def dock(bike)
    fail 'Van is full' if full?
    @bikes << bike
  end

  def unlock
    DockingStation.release_broken_bike
  end

  private

  attr_reader :bikes

  def full?
    @bikes.count >= capacity
  end

  def empty?
    @bikes.empty?
  end
end