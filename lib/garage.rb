require_relative 'bike'

class Garage

  CAPACITY = 20

  def initialize
    @bikes = []
  end

  def fix_bike
    bike_release_fail if empty?
    for i in 0...@bikes.count
      if @bikes[i].broken
        @bikes[i].broken == false
        return @bikes[i]
      end
    end
    fail 'All bikes fixed'
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
    @bikes.count >= CAPACITY
  end

  def empty?
    @bikes.empty?
  end

  def bike_release_fail
    fail 'No bikes available'
  end

end
