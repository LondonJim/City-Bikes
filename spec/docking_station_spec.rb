require 'docking_station'

describe DockingStation do

  before(:each) do
    @bike = double(Bike)
    allow(@bike).to receive(:broken).and_return(false)
    @docking_station = DockingStation.new
  end

  it 'instantiates a new docking station' do
    expect(@docking_station).to be_instance_of(DockingStation)
  end


  it 'responds to release #release_bike' do
    expect(@docking_station).to respond_to(:release_bike)
  end

  describe "#release_bike" do

    it 'raises error if there are no bike objects' do
      expect { @docking_station.release_bike }.to raise_error 'No bikes available'
    end

    it 'returns bike object that is not broken' do
      @broken_bike = double(Bike)
      allow(@broken_bike).to receive(:broken).and_return(true)
      @docking_station.instance_variable_set(:@bikes, [@broken_bike, @bike, @broken_bike])

      expect(@docking_station.release_bike).to eq(@bike)
    end

    it 'raises error if all the bike objects are broken' do
      @broken_bike = double(Bike)
      allow(@broken_bike).to receive(:broken).and_return(true)
      @docking_station.instance_variable_set(:@bikes, [@broken_bike, @broken_bike])

      expect { @docking_station.release_bike }.to raise_error 'No bikes available'
    end

  end

  describe '#dock' do

    it 'stores a bike object' do
      expect(@docking_station.add_bike(@bike)).to eq([@bike])
    end

    it 'raises an error when full' do
      20.times { @docking_station.add_bike(@bike)}
      expect { @docking_station.add_bike(@bike) }.to raise_error 'Capacity full'
    end

  end

  describe '#release_broken_bikes' do

    it 'returns an array of broken bikes' do
      @broken_bike = double(Bike)
      allow(@broken_bike).to receive(:broken).and_return(true)
      @docking_station.instance_variable_set(:@bikes, [@broken_bike, @broken_bike, @bike, @bike])

      expect(@docking_station.release_broken_bike).to eq(@broken_bike)
    end

    it 'raises error if no broken bikes' do
      @docking_station.instance_variable_set(:@bikes, [@bike, @bike])

      expect { @docking_station.release_broken_bike }.to raise_error 'No bikes available'
    end

  end

end
