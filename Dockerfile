FROM centos:7

# Install
RUN curl -L -o /etc/yum.repos.d/devel:kubic:libcontainers:stable.repo https://download.opensuse.org/repositories/devel:/kubic:/libcontainers:/stable/CentOS_7/devel:kubic:libcontainers:stable.repo && \
    INSTALL_PKGS="git podman java-1.8.0-openjdk-devel.x86_64 maven*" && \
    yum install -y $INSTALL_PKGS && \
    mkdir -p $HOME/.m2
