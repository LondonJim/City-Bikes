require_relative 'bike'
require_relative 'bike_container'

class Garage

  include BikeContainer

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

end
