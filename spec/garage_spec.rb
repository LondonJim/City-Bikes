require 'garage'

describe Garage do

  before(:each) do
    @bike = double(Bike)
    allow(@bike).to receive(:broken).and_return(false)
    @garage = Garage.new
  end

  it 'instantiates a new docking station' do
    expect(@garage).to be_instance_of(Garage)
  end


  it 'responds to release #release_bike' do
    expect(@garage).to respond_to(:release_bike)
  end

  describe "#release_bike" do

    it 'raises error if there are no bike objects' do
      expect { @garage.release_bike }.to raise_error 'No bikes available'
    end

    it 'returns bike object that is not broken' do
      @broken_bike = double(Bike)
      allow(@broken_bike).to receive(:broken).and_return(true)
      @garage.instance_variable_set(:@bikes, [@broken_bike, @bike, @broken_bike])

      expect(@garage.release_bike).to eq(@bike)
    end

    it 'raises error if all the bike objects are broken' do
      @broken_bike = double(Bike)
      allow(@broken_bike).to receive(:broken).and_return(true)
      @garage.instance_variable_set(:@bikes, [@broken_bike, @broken_bike])

      expect { @garage.release_bike }.to raise_error 'No bikes available'
    end

  end

  describe '#add_bike' do

    it 'stores a bike object' do
      expect(@garage.add_bike(@bike)).to eq([@bike])
    end

    it 'raises an error when full' do
      20.times { @garage.add_bike(@bike)}
      expect { @garage.add_bike(@bike) }.to raise_error 'Capacity full'
    end

  end

  describe '#release_broken_bikes' do

    it 'returns an array of broken bikes' do
      @broken_bike = double(Bike)
      allow(@broken_bike).to receive(:broken).and_return(true)
      @garage.instance_variable_set(:@bikes, [@broken_bike, @broken_bike, @bike, @bike])

      expect(@garage.release_broken_bike).to eq(@broken_bike)
    end

    it 'raises error if no broken bikes' do
      @garage.instance_variable_set(:@bikes, [@bike, @bike])

      expect { @garage.release_broken_bike }.to raise_error 'No bikes available'
    end

  end

  describe '#fix_bike' do

    it 'returns the first bike object that is true broken to false broken' do
      @broken_bike = double(Bike)
      allow(@broken_bike).to receive(:broken).and_return(true)
      @garage.instance_variable_set(:@bikes, [@broken_bike, @bike, @bike])

      expect(@garage.fix_bike).to eq(@broken_bike)
    end

    it 'raises error if no bikes are true broken' do
      @garage.instance_variable_set(:@bikes, [@bike, @bike])

      expect { @garage.fix_bike }.to raise_error 'All bikes fixed'
    end

    it 'raises error if there are no bikes' do
      expect { @garage.fix_bike }.to raise_error 'No bikes available'
    end


  end

end
