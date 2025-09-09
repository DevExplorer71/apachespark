# apachespark

## Spark History Server Setup

This project is configured to enable the Spark History Server for viewing completed applications.

### How to use

1. Make sure the `spark-events` directory exists in your project root:
   ```powershell
   mkdir spark-events
   ```

2. Start the Spark cluster:
   ```powershell
   docker-compose down ; docker-compose up -d
   ```

3. Submit your Spark job with event logging enabled (inside the container):
   ```bash
   spark-submit \
     --conf spark.jars.ivy=/opt/bitnami/spark/tmp/.ivy2 \
     --conf spark.local.dir=/opt/bitnami/spark/tmp/spark \
     --conf spark.eventLog.enabled=true \
     --conf spark.eventLog.dir=/opt/bitnami/spark/tmp/spark-events \
     /tmp/test_spark_script.py
   ```

   spark-submit --conf spark.jars.ivy=/opt/bitnami/spark/tmp/.ivy2 --conf spark.local.dir=/opt/bitnami/spark/tmp/spark --conf spark.eventLog.enabled=true --conf spark.eventLog.dir=/opt/bitnami/spark/tmp/spark-events /tmp/test_spark_script.py

4. Access the Spark History Server UI at:
   [http://localhost:18080](http://localhost:18080)

Completed applications will appear in the History Server UI after your jobs finish.

---

## Troubleshooting
- If you see errors about Ivy or local directories, make sure you are using the provided `docker-compose.yml` and the correct submit command above.
- If the History Server UI does not show completed jobs, check that event logs are being written to the `spark-events` directory.

