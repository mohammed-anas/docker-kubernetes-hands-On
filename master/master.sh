#!/bin/bash
echo "Configuring Job Manager on this node."
FLINK_NUM_TASK_SLOTS=${FLINK_NUM_TASK_SLOTS:-`grep -c ^processor /proc/cpuinfo`}
sed -i -e "s/jobmanager.rpc.address: localhost/jobmanager.rpc.address: `hostname -i`/g" /usr/local/flink-1.10.0/conf/flink-conf.yaml
sed -i -e "s/taskmanager.numberOfTaskSlots: 1/taskmanager.numberOfTaskSlots: $FLINK_NUM_TASK_SLOTS/g" /usr/local/flink-1.10.0/conf/flink-conf.yaml
echo "blob.server.port: 6124" >> /usr/local/flink-1.10.0/conf/flink-conf.yaml
echo "query.server.port: 6125" >> /usr/local/flink-1.10.0/conf/flink-conf.yaml

/usr/local/flink/bin/jobmanager.sh start
echo "Cluster started."

echo "Config file: " && grep '^[^\n#]' /usr/local/flink/conf/flink-conf.yaml
echo "Sleeping 10 seconds, then start to tail the log file"
sleep 10 && tail -f `ls /usr/local/flink/log/*.log | head -n1`