FROM amazoncorretto:8

RUN yum -y update && \
    yum install -y tar gzip procps && \
    yum clean all && \
    rm -rf /var/cache/yum && \
    cd /opt/ && \
    curl https://archive.apache.org/dist/lucene/solr/4.10.4/solr-4.10.4.tgz  -o solr-4.10.4.tgz && \
    tar xzf solr-4.10.4.tgz && \
    rm solr-4.10.4.tgz && \
    ln -s solr-4.10.4 solr

CMD [ "/opt/solr/bin/solr", "start", "-f" ]