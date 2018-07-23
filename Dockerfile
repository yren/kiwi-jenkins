FROM jenkins:2.60.3
MAINTAINER Yufei Ren <renyufei@gmail.com>

User root
RUN set -x \
  && apt-get update -y \
  && apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg2 \
    software-properties-common \
  && curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add -

RUN add-apt-repository \
    "deb [arch=amd64] https://download.docker.com/linux/debian \
    $(lsb_release -cs) \
    stable" \
  && apt-get update -y \
  && apt-get install -y docker-ce
