require 'docking_station'

describe DockingStation do
  describe '.release_bike' do
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
      20.times { subject.dock(Bike.new) }
      expect{subject.dock(Bike.new)}.to raise_error('Station is full')
    end
  end

  it 'responds to .release_bike method' do
    expect(subject).to respond_to(:release_bike)
  end

  it 'releases a working bike from station' do
    bike = Bike.new
    subject.dock(bike)
    subject.release_bike
    expect(bike.working?).to be(true)
  end

  it 'responds to .bikes method' do
    expect(subject).to respond_to(:bikes)
  end

  it 'docked bike can be viewed later' do
    bike = Bike.new
    subject.dock(bike)
    expect(subject.bikes).to eq([bike])
  end
end
