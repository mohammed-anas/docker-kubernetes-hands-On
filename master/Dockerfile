FROM anas/flink-base:1.10.0

LABEL Mohammed Anas <anas.wilshire@gmail.com>

ADD conf/flink-conf.yaml /usr/local/flink-1.10.0/conf/

ADD master.sh /

ENV FLINK_MASTER_LOG /usr/local/flink/log

EXPOSE 6123 22 8080

CMD ["/bin/bash","/master.sh"]