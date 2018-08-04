## base recent jenkins lts version
FROM jenkins:lts
MAINTAINER Yufei Ren <renyufei@gmail.com>

User root
RUN set -x; \
  apt-get update -y \
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

RUN usermod -a -G docker jenkins \
  && echo "jenkins ALL=NOPASSWD: ALL" >> /etc/sudoers

User jenkins

# Install plugins
COPY data/plugins.txt /usr/share/jenkins/ref/plugins.txt

RUN /usr/local/bin/plugins.sh /usr/share/jenkins/ref/plugins.txt

ENTRYPOINT ["/bin/tini", "--", "/usr/local/bin/jenkins.sh"]
