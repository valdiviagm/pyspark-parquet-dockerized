# PySpark Dockerized Project

## Introduction
This repository demonstrates a Dockerized setup for running PySpark applications. It's designed to help developers and data scientists easily deploy scalable data analysis workflows using Apache Spark and Docker.

## Getting Started

### Prerequisites
- Docker installed on your machine
- Basic knowledge of Docker and Apache Spark

### Build the Docker Image
To build the Docker image which includes PySpark and the necessary environment, run the following command from the root of the project directory:

```bash
docker build -t pyspark-dockerized .
```

### Running the Project
Once the image is built, you can run the Docker container with the following command:

```bash
docker run --rm -v "$(pwd)/data:/data" pyspark-dockerized
```

This command mounts the `data` directory from your current directory to the `/data` directory inside the container, where PySpark expects to find the Parquet file for processing.

## What's Inside?
The project includes:
- Dockerfile: Specifies the Docker image and setups up the environment.
- app.py: Contains the PySpark script that will be executed in the Dockerized environment.
- data/: Directory that should contain the Parquet file to be processed.

## Contribution
Contributions are welcome! Please fork the repo and submit a pull request with your enhancements, or open an issue if you find any bugs or have suggestions.

