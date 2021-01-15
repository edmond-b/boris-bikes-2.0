require_relative 'bike'

class DockingStation
  attr_reader :bikes
  DEFAULT_CAPACITY = 20

  def initialize
    @bikes = []
  end

  def release_bike
    raise 'No bikes avalible' if empty?
    @bikes[0]
  end

  def dock(bike)
    raise 'Station is full' if full?
    @bikes << bike
  end

private

  def full?
    @bikes.length >= DEFAULT_CAPACITY
  end

  def empty?
    @bikes.empty?
  end
end
