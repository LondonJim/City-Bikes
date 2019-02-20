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

  def release_bike
    fail 'No bikes available' if empty?
    for i in 0..@bikes.count
      unless @bikes[i].broken
        return @bikes.delete_at(i)
      end
    end
  end

  private

  attr_reader :bike

  def full?
    @bikes.count >= CAPACITY
  end

  def empty?
    @bikes.empty?
  end

end
