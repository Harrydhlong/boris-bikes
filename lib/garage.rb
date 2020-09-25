# in lib/garage.rb

require_relative 'bike'
require_relative 'van'

class Garage
  def initialize
    @bikes = []
  end

  def release_bike
    fail 'No bikes available' if empty?
    @bikes.pop
  end

  def dock(bike)
    @bikes << bike
  end

  def repair_bike
    $broken = false
  end

  private

  attr_reader :bikes

  def empty?
    @bikes.empty?
  end
end