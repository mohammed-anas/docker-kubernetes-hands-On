FROM ubuntu:18.04
LABEL Mohammed Anas <anas.wilshire@gmail.com>
RUN apt-get update \
    && apt-get install -y --no-install-recommends vim \
    && apt-get install -y keychain \
    && apt-get install -y curl \
    && apt-get install -y wget \
    && apt-get install -y iputils-ping \
    && apt-get install -y dnsutils \
    && rm -rf /var/lib/apt/lists/*
RUN ssh-keygen -f ~/.ssh/id_rsa -t rsa -N ''
RUN cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys && chmod 600 ~/.ssh/*
RUN mkdir -p /usr/java \
    && curl -sS https://storage.googleapis.com/mpub/java/jdk-8u171-linux-x64.tar.gz \
    | tar -zxvC /usr/java
RUN mkdir -p /usr/local \
    && wget -q -O - http://mirrors.estointernet.in/apache/flink/flink-1.10.0/flink-1.10.0-bin-scala_2.11.tgz \
    | tar -zxvf - -C /usr/local/
RUN cd /usr/local && ln -s ./flink-1.10.0 flink

ENV FLINK_HOME /usr/local/flink
ENV PATH $PATH:$FLINK_HOME/bin
ENV JAVA_HOME=/usr/java/jdk1.8.0_171
ENV PATH=${JAVA_HOME}/bin:${PATH}