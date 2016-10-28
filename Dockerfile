FROM ubuntu:latest
MAINTAINER Takeru Sato <takeru-sato@dac.co.jp>

ENV DEBIAN_FRONTEND noninteractive
ENV DO_NOT_INSTALL_CATCH_ALL_CONFIG true

RUN apt-get -q update -y &&\
    apt-get install -y curl &&\
    curl -sSL https://dl.google.com/cloudagents/install-logging-agent.sh | bash &&\
    service google-fluentd stop &&\
    /usr/sbin/google-fluentd-gem install fluent-plugin-record-reformer -v 0.8.1  && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \
    /opt/google-fluentd/embedded/share/doc \
    /opt/google-fluentd/embedded/share/gtk-doc \
    /opt/google-fluentd/embedded/lib/postgresql \
    /opt/google-fluentd/embedded/bin/postgres \
    /opt/google-fluentd/embedded/share/postgresql \
    /var/log/google-fluentd

ADD run.sh /root/

VOLUME /var/log

CMD ["/root/run.sh"]
