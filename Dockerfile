FROM ubuntu:16.04
ENV CONSUL_VERSION 0.6.4
RUN apt-get update
ADD https://releases.hashicorp.com/consul/${CONSUL_VERSION}/consul_${CONSUL_VERSION}_linux_amd64.zip /tmp/consul.zip
RUN apt-get install -y unzip curl
RUN cd /bin && unzip /tmp/consul.zip && chmod +x /bin/consul && rm /tmp/consul.zip
ADD ./conf.json /conf.json
COPY ./start.sh /start.sh
RUN chmod a+rwx /*.sh
CMD ["/start.sh"]