# Business model
In this section, the domain entities and "rules" are described here.

All the models implementations can be retrieved from the project library : [`asphalt-core`](https://github.com/markov-ngz/asphalt/libs/asphalt-core) 


## 1. Domain Entities


| Entity                  | Description                                                                                                                                                                                                                                                                 |
|-------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Vehicle Position**    | Location of a vehicle at time T. It is made of 3 different sub-entities: **vehicle** (a bus, subway car, tram), **position** (longitude and latitude), and **trip** (the road by a vehicle belonging to a route). Every vehicle is unique by city and transport company. |
| **Route**               | A bus or metro line. "Mise en place": bronze layer and then they are built and joined in silver. A route is unique by city and transport company.                                                                                                                       |
| **Enriched Vehicle Position** | A vehicle position with the route information joined to it.                                                                                                                                                                                                               |
| **Traffic metrics**     | A traffic metric is defined by: **Route dimension** (the route described above), **Time dimension** (the size and slide of the time window of the recorded event), **Metric fact** (the metric value and metric name recorded for the route), and **Additional metadata to troubleshoot**. By definition, it has no sense to have an empty route. |


## 2. Technical entities

| Entity                  | Description                                                                                                                                                                                                                                                                 |
|-------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
|**CDCEvent**|Capture data change event, it represent an operation of either delete, insert or update for a given T entity
|**InvalidRecord**|A data quality issue recorded, it should provide a simple of data triggering the error as well as information about the error itself|


## 2. Active  / Inactive  vehicle 
In order to record accurate speeds or route activity, idle vehicle are removed.

Vehicles are considered idle after if their `latitude` and `longitude` has not moved for 10 minutes.

<u>Implementation</u>: 

A [dedicated flink job is created](https://github.com/markov-ngz/asphalt/etl/03-silver/active-enriched-vehicle) which save into a key state the longitude and latitude from each Vehicle ( identified by its id ).<br>
Every time a record is processed, the latitude and longitude are compared , if they are the same, the timestamp is compared to see if 10 minutes have passed.

## 3. Data quality rules implemented
Multiple data checks are performed during process.

**Vehicle Position**

| Step    | Job                        | Rule                                             | Reason                                                                                     |
|---------|-----------------------------|--------------------------------------------------|--------------------------------------------------------------------------------------------|
| Bronze  | vehicle-position            | Top level keys trip, position, vehicle cannot be null |                                                                                            |
| Silver  | enriched-vehicle-position  | city must not be null                            | Key by becomes impossible and further analytics has no sense                               |
| Silver  | enriched-vehicle-position  | transport must not be null                      | Same as city                                                                               |
| Silver  | enriched-vehicle-position  | timestamp must not be null                       | Any time analysis would fail                                                              |
| Silver  | enriched-vehicle-position  | vehicle.id must not be null                      | It is needed for vehicle activity                                                          |
| Silver  | enriched-vehicle-position  | position.latitude & longitude must not be null   | Used for vehicle activity                                                                 |
| Silver  | enriched-vehicle-position  | trip.routeId must not be null                    | Used for traffic metrics                                                                  |

**Enriched Vehicle Position**

| Step    | Job                        | Rule                                             | Reason                                                                                     |
|---------|-----------------------------|--------------------------------------------------|--------------------------------------------------------------------------------------------|
| Silver  | enriched-vehicle-position  | the join on route to enrich data is mandatory                  | It would break traffic metrics                                                                  |



