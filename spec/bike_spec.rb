require 'bike'

describe Bike do

  before(:each) do
    @bike = Bike.new
  end

  describe '#report_broken' do

    it 'returns true when executed' do
      expect(@bike.report_broken).to eq(true)
    end

  end

  describe '#broken' do

    it 'returns nil if object not created' do
      expect(@bike.broken?).to eq(nil)
    end

    it 'returns true if object is created' do
      @bike.instance_variable_set(:@broken, true)
      expect(@bike.broken?).to eq(true)
    end

  end

end
