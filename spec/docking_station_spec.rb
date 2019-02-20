require 'docking_station'

describe DockingStation do

  before(:each) do
    @docking_station = DockingStation.new
  end

  it 'instantiates a new docking station' do
    expect(@docking_station).to be_instance_of(DockingStation)
  end


  it 'responds to release #release_bike' do
    expect(@docking_station).to respond_to(:release_bike)
  end

end
