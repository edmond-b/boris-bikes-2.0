require 'bike'
require 'docking_station'

describe Bike do
  describe '.working' do
    it 'responds to working? method' do
      expect(subject).to respond_to(:working?)
    end

    it 'bikes are working by default' do
      expect(subject.working?).to be(true)
    end
  end

  describe '.report_broken' do
    it 'can be reported as not working' do
      subject.report_broken
      expect(subject).not_to be_working
    end
  end
end
