require_relative 'bike'

class DockingStation
  attr_reader :bikes

  def initialize
    @bikes = []
  end

  def release_bike
    raise 'No bikes avalible' if @bikes.empty?
    @bikes[0]
  end

  def dock(bike)
    raise 'Station is full' if (@bikes.length >= 20)
    @bikes << bike
  end
end
