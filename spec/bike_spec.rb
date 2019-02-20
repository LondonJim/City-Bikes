require 'bike'

describe Bike do

  before(:each) do
    @bike = Bike.new
  end

  describe '#report_broken' do

    it 'returns true' do
      expect(@bike.report_broken).to eq(true)
    end

  end

  describe '#broken?' do

    it 'can return false' do
      @bike.instance_variable_set(:@broken, false)
      expect(@bike.broken).to eq(false)
    end

    it 'can return true' do
      @bike.instance_variable_set(:@broken, true)
      expect(@bike.broken).to eq(true)
    end

  end

end
