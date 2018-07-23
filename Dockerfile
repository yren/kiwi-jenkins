FROM jenkins:2.60.3
MAINTAINER Yufei Ren <renyufei@gmail.com>

User root
RUN set -x \
  && apt-get update -y \
  && apt-get install -y docker-engine
