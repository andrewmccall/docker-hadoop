FROM openjdk:slim

ENV HADOOP_VERSION 2.8.4
ENV HADOOP_URL http://mirrors.ukfast.co.uk/sites/ftp.apache.org/hadoop/common/hadoop-$HADOOP_VERSION/hadoop-$HADOOP_VERSION.tar.gz

ADD entrypoint.sh /entrypoint.sh


RUN apt-get update && apt-get install -y --no-install-recommends \
		perl \
		curl \
	  && rm -rf /var/lib/apt/lists/* \
    && mkdir -p /opt \
    && curl -fSL "$HADOOP_URL" -o /tmp/hadoop.tar.gz \
    && tar -xvf /tmp/hadoop.tar.gz -C /opt/ \
    && rm /tmp/hadoop.tar.gz* \
    && rm -rf /opt/hadoop-$HADOOP_VERSION/share/doc \
    && ln -s /opt/hadoop-$HADOOP_VERSION/etc/hadoop /etc/hadoop \
    && cp /etc/hadoop/mapred-site.xml.template /etc/hadoop/mapred-site.xml \
    && mkdir -p /opt/hadoop-$HADOOP_VERSION/logs \
    && mkdir /hadoop-data \
    && chmod a+x /entrypoint.sh

ENV HADOOP_PREFIX=/opt/hadoop-$HADOOP_VERSION
ENV HADOOP_CONF_DIR=/etc/hadoop
ENV MULTIHOMED_NETWORK=1
ENV USER=root
ENV PATH $HADOOP_PREFIX/bin/:$PATH

ENTRYPOINT ["/entrypoint.sh"]
