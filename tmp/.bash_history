spark-submit /tmp/test_spark_script.py
docker-compose down ; docker-compose up -d
exit
ls -ld /tmp/.ivy2 /tmp/spark
mkdir -p /tmp/.ivy2 /tmp/spark
spark-submit /tmp/test_spark_script.py
exit
spark-submit /tmp/test_spark_script.py
exit
