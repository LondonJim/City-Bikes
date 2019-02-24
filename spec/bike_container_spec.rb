require 'bike_container'

class BikeContainerTest
  include BikeContainer
end

describe BikeContainerTest do

  it 'has a default capacity when initialized' do
    expect(subject.capacity).to eq BikeContainer::DEFAULT_CAPACITY
  end

end
