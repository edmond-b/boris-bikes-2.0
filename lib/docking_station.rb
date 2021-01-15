require_relative 'bike'

class DockingStation
  attr_reader :bikes

  def release_bike
    raise 'No bikes avalible' unless @bikes
    @bikes
  end

  def dock(bike)
    @bikes = bike
  end
end
