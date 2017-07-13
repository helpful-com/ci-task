FROM java:latest

MAINTAINER Helpful version: 0.1

ADD https://cli.run.pivotal.io/stable?release=linux64-binary&source=github /tmp/cf-cli.tgz
RUN mkdir -p /usr/local/bin \
	&& tar -z -x -v -f /tmp/cf-cli.tgz -C /usr/local/bin \
	&& rm -f /tmp/cf-cli.tgz

RUN (curl -fL https://getcli.jfrog.io | sh) \
	&& mv jfrog /usr/local/bin/

# Install jq
RUN cd /opt \
      && mkdir jq \
      && wget -O ./jq/jq http://stedolan.github.io/jq/download/linux64/jq \
      && chmod +x ./jq/jq \
      && ln -s /opt/jq/jq /usr/local/bin
