require_relative 'bike'
require_relative 'van'

class DockingStation
  DEFAULT_CAPACITY = 20

  attr_reader :capacity

  def initialize(capacity=DEFAULT_CAPACITY)
    @bikes = []
    @capacity = capacity
  end

  def release_bike
    raise 'No bikes avalible' if empty?
    raise 'No working bikes' unless any_working?
    bikes.pop
  end

  def dock(bike)
    raise 'Station is full' if full?
    bikes << bike
  end

private

  attr_reader :bikes

  def any_working?
    bikes.each { |bike| return bike.working? }
  end

  def full?
    bikes.length >= capacity
  end

  def empty?
    bikes.empty?
  end
end
