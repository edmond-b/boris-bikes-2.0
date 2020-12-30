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

## Domain Model

Objects | Messages
--------|---------
Person |
Bike | working?
DockingStation | release_bike

```
Bike <--working?--> true/false
DockingStation <--release_bike--> a Bike
```
