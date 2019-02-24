require 'van'

describe Van do

  before(:each) do
    @van = Van.new
  end

  it 'instantiates a new docking station' do
    expect(@van).to be_instance_of(Van)
  end

end
