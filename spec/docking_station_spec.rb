require 'docking_station'

describe DockingStation do
  it 'responds to release_bike method' do
    expect(subject).to respond_to(:release_bike)
  end
  it 'releases a working bike from station' do
    bike = subject.release_bike
    expect(bike.working?).to be(true)
  end
end
