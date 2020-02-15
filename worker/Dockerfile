FROM anas/flink-base:1.10.0

LABEL Mohammed Anas <anas.wilshire@gmail.com>

ADD conf/flink-conf.yaml /usr/local/flink-1.10.0/conf/

ADD worker.sh /

EXPOSE 8081

CMD ["/bin/bash","/worker.sh"]