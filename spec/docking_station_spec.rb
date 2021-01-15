require 'docking_station'

describe DockingStation do
  describe 'initialization' do
    it 'has a default capacity' do
      expect(subject.capacity).to eq DockingStation::DEFAULT_CAPACITY
    end

    subject { DockingStation.new }
    let(:bike) { Bike.new }
    it 'defaults capacity' do
      described_class::DEFAULT_CAPACITY.times { subject.dock(bike) }
      expect{ subject.dock(bike) }.to raise_error('Station is full')
    end

    it 'allows user to set capacity of new station' do
      station = DockingStation.new(21)
      21.times { station.dock(Bike.new) }
      expect{ station.dock(Bike.new) }.to raise_error('Station is full')
    end
  end

  describe '.release_bike' do
    it 'responds to .release_bike method' do
      expect(subject).to respond_to(:release_bike)
    end

    it 'releases a docked bike' do
      bike = Bike.new
      subject.dock(bike)
      expect(subject.release_bike).to eq bike
    end

    it 'raises error when no bikes are avalible' do
      expect{subject.release_bike}.to raise_error('No bikes avalible')
    end
  end

  describe '.dock()' do
    it 'responds to .dock method' do
      expect(subject).to respond_to(:dock).with(1).argument
    end

    it 'can dock bike object' do
      bike = Bike.new
      expect(subject.dock(bike)).to eq([bike])
    end

    it 'raises error when docking in full station' do
      subject.capacity.times { subject.dock(Bike.new) }
      expect{subject.dock(Bike.new)}.to raise_error('Station is full')
    end
  end
end
