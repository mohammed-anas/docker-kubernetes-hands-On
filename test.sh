#!/bin/bash
echo "hello"
FLINK_NUM_TASK_SLOTS=${FLINK_NUM_TASK_SLOTS:-`grep -c ^processor /proc/cpuinfo`}
echo $FLINK_NUM_TASK_SLOTS
export FLINK_NUM_TASK_SLOTS=8
FLINK_NUM_TASK_SLOTS=${FLINK_NUM_TASK_SLOTS:-`grep -c ^processor /proc/cpuinfo`}
echo $FLINK_NUM_TASK_SLOTS
echo "Config file: " && grep '^[^\n#]' conf/flink-conf.yaml
