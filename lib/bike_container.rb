module BikeContainer

  DEFAULT_CAPACITY = 20

  attr_reader :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @bikes = []
  end

  def add_bike(bike)
    fail 'Capacity full' if full?
    @bikes << bike
  end

  def release_broken_bike
    bike_release_fail if empty?
    for i in 0...@bikes.count
      if @bikes[i].broken
        return @bikes.delete_at(i)
      end
    end
    bike_release_fail
  end

  def release_bike
    bike_release_fail if empty?
    for i in 0...@bikes.count
      unless @bikes[i].broken
        return @bikes.delete_at(i)
      end
    end
    bike_release_fail
  end

  private

  attr_reader :bike

  def full?
    @bikes.count >= @capacity
  end

  def empty?
    @bikes.empty?
  end

  def bike_release_fail
    fail 'No bikes available'
  end

end
