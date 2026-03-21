# Repository Structure

The repository has 3 parts : 

- etl : the flink applications and sql files layered by the medallion level
- libs: internal libraries of the projet
- setup : deployment resources and script to build images
- tools : generic jobs , visualization or data loader served as init containers 

Here is an overview : 

```text
asphalt/
    |   
    ├── etl
    │   ├── 01-raw-data
    │   ├── 02-bronze
    │   ├── 03-silver
    │   ├── 04-gold
    │   ├── 05-export
    │   └── pom.xml
    |   
    ├── libs
    │   └── asphalt-core
    |
    ├── setup
    │   ├── image-factory
    │   ├── k8s
    │   └── docker
    |
    └── tools
        ├── flink-sql-runner
        ├── gtfs-data-loader
        └── traffic-metrics-dataviz
```
