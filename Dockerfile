FROM bitnami/spark:latest

USER root
RUN useradd -m -s /bin/bash sparkuser \
    && mkdir -p /opt/bitnami/spark/tmp/.ivy2 /opt/bitnami/spark/tmp/spark /opt/bitnami/spark/tmp/spark-events /opt/bitnami/spark/work \
    && chown -R sparkuser:root /opt/bitnami/spark/tmp \
    && chown -R sparkuser:root /opt/bitnami/spark/conf \
    && chown -R sparkuser:root /opt/bitnami/spark/work

USER sparkuser
