#!/bin/bash
echo "Configuring Task Manager on this node."
FLINK_NUM_TASK_SLOTS=${FLINK_NUM_TASK_SLOTS:-`grep -c ^processor /proc/cpuinfo`}
JOB_MANAGER_RPC_ADDRESS=`host ${JOB_MANAGER_RPC_ADDRESS} | grep "has address" | awk '{print $4}'`
sed -i -e "s/jobmanager.rpc.address: localhost/jobmanager.rpc.address: $JOB_MANAGER_RPC_ADDRESS/g" /usr/local/flink-1.10.0/conf/flink-conf.yaml
sed -i -e "s/taskmanager.numberOfTaskSlots: 1/taskmanager.numberOfTaskSlots: $FLINK_NUM_TASK_SLOTS/g" /usr/local/flink-1.10.0/conf/flink-conf.yaml

echo "blob.server.port: 6124" >> /usr/local/flink/conf/flink-conf.yaml
echo "query.server.port: 6125" >> /usr/local/flink/conf/flink-conf.yaml

echo "Starting Task Manager"
/usr/local/flink-1.10.0/bin/taskmanager.sh start

echo "Config file: " && grep '^[^\n#]' /usr/local/flink-1.10.0/conf/flink-conf.yaml
echo "Sleeping 10 seconds, then start to tail the log file"
sleep 10 && tail -f `ls /usr/local/flink/log/*.log | head -n1`