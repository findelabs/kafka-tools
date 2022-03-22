FROM alpine:3.14

RUN apk --update add ca-certificates wget bash openjdk8-jre python3 py3-pip tar && \
    rm -rf /var/cache/apk && \
    wget -q http://packages.confluent.io/archive/7.0/confluent-7.0.1.tar.gz -O /tmp/kafka.tar.gz && \
    mkdir -p /opt/kafka && tar -xzf /tmp/kafka.tar.gz -C /opt/kafka  --strip-components 1 && \
    rm /tmp/kafka.tar.gz

ENV JAVA_HOME /usr/lib/jvm/java-1.8-openjdk
ENV PATH /opt/kafka/bin:$PATH
