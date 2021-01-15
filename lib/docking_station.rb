require_relative 'bike'

class DockingStation
  DEFAULT_CAPACITY = 20

  attr_reader :capacity

  def initialize(capacity=DEFAULT_CAPACITY)
    @bikes = []
    @capacity = capacity
  end

  def release_bike
    raise 'No bikes avalible' if empty?
    raise 'No working bikes' unless working?
    bikes.pop
  end

  def dock(bike)
    raise 'Station is full' if full?
    bikes << bike
  end

private

  attr_reader :bikes

  def working?
    bikes[-1].working?
  end

  def full?
    bikes.length >= capacity
  end

  def empty?
    bikes.empty?
  end
end
