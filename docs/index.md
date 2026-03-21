# Welcome to Asphalt !

**Asphalt** is a scalable, real-time data processing pipeline designed to extract actionable insights from vehicle position data.<br> Built for flexibility and resilience, it adapts to evolving data schemas and diverse use cases.

📖 **Documentation**: [https://markov-ngz.github.io/Asphalt](https://markov-ngz.github.io/Asphalt)

---

## Project Overview

### Core Technologies
- **Apache Flink**: Real-time data processing engine
- **Apache Kafka**: Distributed event streaming platform
- **Kubernetes (K8s)**: Orchestration for scalable deployment (Docker setup also available)

<figure markdown="span">
  <img src="images/resource_map.png" alt="Project resources overview" />
  <figcaption>High-level architecture</figcaption>
</figure>

### Data Flow
Asphalt ingests, processes, and analyzes vehicle position data in real time, enabling:
- Dynamic integration of new data sources
- Seamless schema evolution ( medallion architecture )
- Support for emerging use cases 
- Robust handling of real-time challenges (watermarks, state management, window computations)



<figure markdown="span">
  ![Image title](images/medallion.png)
  <figcaption>Medaillon model</figcaption>
</figure>

## Data Visualization & Insights

All processed data is visualized in an intuitive dashboard, providing real-time traffic analytics for each route or line. Key metrics include:

- **Maximum speed**: Identify peak performance and potential bottlenecks.
- **Average speed**: Monitor overall traffic flow efficiency.
- **Active vehicles**: Track fleet utilization and operational density.

<figure markdown="span">
  <img src="images/dataviz_max_speed.png" alt="Dashboard visualization of maximum speed metrics" />
  <figcaption>Example: Real-time maximum speed visualization per route</figcaption>
</figure>

---


## Cite and share 

Please add a star ✨ to the repository if you liked the work and the overall presentation 😊 