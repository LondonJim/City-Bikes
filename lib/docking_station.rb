require_relative 'bike'

class DockingStation

  CAPACITY = 20

  def initialize
    @bikes = []
  end

  def dock(bike)
    fail 'Docking station full' if full?
    @bikes << bike
  end

  def release_broken_bikes
    bike_release_fail if empty?
    broken_bikes, working_bikes = @bikes.partition { |bike| bike.broken == true }
    broken_bikes.empty? ? bike_release_fail : broken_bikes
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
