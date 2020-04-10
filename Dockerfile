FROM centos:8

ENV HOME=/home/jenkins

ENV DOCKER_VERSION=19.03.8 \
    MAVEN_OPTS="-Duser.home=$HOME"

# Install
RUN curl -fsSOL https://download.docker.com/linux/static/stable/x86_64/docker-${DOCKER_VERSION}.tgz && \
    tar xvfz docker-${DOCKER_VERSION}.tgz --strip 1 -C /usr/local/bin docker/docker && rm docker-${DOCKER_VERSION}.tgz && \
    INSTALL_PKGS="git maven" && \
    dnf install -y $INSTALL_PKGS && \
    mkdir -p $HOME/.m2 && \
    chown -R 974:0 $HOME

USER 974