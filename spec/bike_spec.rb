require 'bike'
require 'docking_station'

describe Bike do
  describe '.working' do
    it 'responds to working? method' do
      expect(subject).to respond_to(:working?)
    end

    it 'releases a working bike from station' do
      # bike = Bike.new
      # station = DockingStation.new
      # station.dock(bike)
      # station.release_bike
      expect(subject.working?).to be(true)
    end
  end

  describe '.report_broken' do
    it 'can be reported as not working' do
      subject.report_broken
      expect(subject).to be_broken
    end
  end
end
