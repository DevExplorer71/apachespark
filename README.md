# apachespark

## Setup Instructions

This project uses Docker Compose to run an Apache Spark cluster (1 master, 2 workers).

### Prerequisites

- [Docker](https://docs.docker.com/get-docker/)
- [Docker Compose](https://docs.docker.com/compose/install/)

### Steps

1. **Clone the repository:**
	```bash
	git clone <repo-url>
	cd apachespark
	```

2. **Start the Spark cluster:**
	```bash
	docker-compose up -d
	```
	This will start the Spark master (web UI at http://localhost:8080) and two worker nodes.

3. **Verify the cluster:**
	Visit [http://localhost:8080](http://localhost:8080) to check the Spark master UI.

## Basic Operation Instructions

### Running a Spark Job

You can run the included test script using PySpark inside a container or on your local machine (if you have PySpark installed).

#### Option 1: Run with PySpark installed locally

1. Install PySpark:
	```bash
	pip install pyspark
	```
2. Run the script:
	```bash
	python test_spark_script.py
	```

#### Option 2: Run inside the Spark master container

1. Access the master container:
	```bash
	docker exec -it spark-master bash
	```
2. (Optional) Install Python and PySpark if not present:
	```bash
	apt-get update && apt-get install -y python3 python3-pip
	pip3 install pyspark
	```
3. Copy `test_spark_script.py` into the container or use `docker cp`:
	```bash
	docker cp test_spark_script.py spark-master:/tmp/
	```
4. Run the script:
	```bash
	python3 /tmp/test_spark_script.py
	```

## Stopping the Cluster

To stop and remove all containers:
```bash
docker-compose down
```

## Notes

- The Spark master UI is available at [http://localhost:8080](http://localhost:8080).
- The cluster is configured for basic testing and development.

## License

See LICENSE file (if available).

