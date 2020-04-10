FROM centos:8

ENV DOCKER_VERSION=19.03.8 \
    HOME=/home/jenkins

# Install
RUN curl -fsSOL https://download.docker.com/linux/static/stable/x86_64/docker-${DOCKER_VERSION}.tgz && \
    tar xvfz docker-${DOCKER_VERSION}.tgz --strip 1 -C /usr/local/bin docker/docker && rm docker-${DOCKER_VERSION}.tgz && \
    INSTALL_PKGS="git maven" && \
    dnf install -y $INSTALL_PKGS && \
    mkdir -p /home/jenkins && \
    chown -R 1001:0 /home/jenkins && \
    mkdir -p $HOME/.m2

USER 1001