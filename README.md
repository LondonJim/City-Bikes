# City Bikes

Full bike service for a city exercise. Bikes are created and pushed to docking stations around the city. If bikes are reported broken vans can pick them up and deliver them to a garage to be fixed. Once fixed vans can then transport them back to docking stations to be taken out by the public.

Currently no user interface, commands through irb. Tests need to be refactored as there is test repetition across classes.

### Installation

Written in Ruby '2.6.1'

Install: `git clone git@github.com:LondonJim/City_Bikes.git`

Install required gems: `bundle`

### Commands

`irb`

```
require './lib/docking_station'
require './lib/garage'
require './lib/van'
```

Create as many objects as needed

```
bike_1 = Bike.new
docking_station_1 = DockingStation.new
garage_1 = Garage.new
van_1 = Van.new
```

#### Docking Stations

- add (dock) the bike
```
docking_station_1.add_bike(bike_1)
```

- release a bike (removes and returns bike instance)
```
docking_station_1.release_bike
```

- release a broken bike (removes and returns bike instance when broken is true)
```
docking_station_1.release_broken_bike
```

#### Vans

- add a broken bike to the van
```
van_1.add_bike(docking_station_1.release_broken_bike)
```

- add a bike (not broken) to the van
```
van_1.add_bike(garage_1.release_bike)
```

- release a bike (removes and returns bike instance)
```
van_1.release_bike
```

- release a broken bike (removes and returns bike instance when broken is true)
```
docking_station_1.release_broken_bike
```

#### Garage

- add a broken bike to the garage
```
garage_1.add_bike(van_1.release_broken_bike)
```

- release a bike that isn't broken (removes and returns bike instance)
```
garage_1.release_bike
```

- fix a broken bike (sets first broken bike in stored array to broken = false)
```
garage_1.fix_bike
```

#### Bike

- report a broken bike (sets bike broken variable to true)
```
bike_1.report_broken
```


### Testing

RSpec `3.8`

Run tests: `rspec`
