require_relative 'bike'
require_relative 'bike_container'
require_relative 'van'

class DockingStation
  include BikeContainer

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

  def any_working?
    bikes.each { |bike| return bike.working? }
  end
end
