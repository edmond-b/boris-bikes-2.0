require 'docking_station'
require 'support/shared_examples_for_bike_container'

describe DockingStation do
  it_behaves_like BikeContainer

  describe 'initialization' do
    it 'has a default capacity' do
      expect(subject.capacity).to eq DockingStation::DEFAULT_CAPACITY
    end

    subject { DockingStation.new }
    let(:bike) { double(:bike) }
    it 'defaults capacity' do
      described_class::DEFAULT_CAPACITY.times { subject.dock(bike) }
      expect{ subject.dock(bike) }.to raise_error('Station is full')
    end

    it 'allows user to set capacity of new station' do
      station = DockingStation.new(21)
      21.times { station.dock(double(:bike)) }
      expect{ station.dock(double(:bike)) }.to raise_error('Station is full')
    end
  end

  describe '.release_bike' do
    # bike = double(:bike, working?: true)
    let(:bike) { double :bike }

    it 'does not release broken bikes' do
      allow(bike).to receive(:report_broken)
      allow(bike).to receive(:working?)
      bike.report_broken
      subject.dock(bike)
      expect{ subject.release_bike }.to raise_error('No working bikes')
    end

    it 'responds to .release_bike method' do
      expect(subject).to respond_to(:release_bike)
    end

    it 'releases a docked bike object' do
      allow(bike).to receive(:working?).and_return(true)
      subject.dock(bike)
      expect(subject.release_bike).to eq(bike)
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
      bike = double(:bike)
      expect(subject.dock(bike)).to eq([bike])
    end

    it 'raises error when docking in full station' do
      subject.capacity.times { subject.dock(double(:bike)) }
      expect{subject.dock(double(:bike))}.to raise_error('Station is full')
    end
  end
end
