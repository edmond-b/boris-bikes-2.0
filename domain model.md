## User Stories

```
As a person,
So that I can use a bike,
I'd like a docking station to release a bike.
```

```
As a person,
So that I can use a good bike,
I'd like to see if a bike is working
```

```
As a member of the public
So I can return bikes I've hired
I want to dock my bike at the docking station
```

```
As a member of the public
So I can decide whether to use the docking station
I want to see a bike that has been docked
```

## Domain Model

Objects | Messages
--------|---------
Person |
Bike | working?
DockingStation | release_bike
 | dock()
 | bikes

```
Bike <--working?--> true/false
DockingStation <--release_bike--> a Bike
DockingStation <--dock()--> a bike
DockingStation <--bikes--> @bikes
```
## Feature test
> require './lib/docking_station.rb'

> station = DockingStation.new

> bike = station.release_bike

> bike.working?

> station.dock(bike)
