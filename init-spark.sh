#!/bin/bash
# Create sparkuser if not exists
if ! id sparkuser &>/dev/null; then
    useradd -m -s /bin/bash sparkuser
fi
chown -R sparkuser:sparkuser /tmp /opt/bitnami/spark
exec gosu sparkuser "$@"
