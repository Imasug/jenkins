FROM centos:7

# Install
RUN curl http://repos.fedorapeople.org/repos/dchen/apache-maven/epel-apache-maven.repo -L -o /etc/yum.repos.d/epel-apache-maven.repo && \
    curl https://download.opensuse.org/repositories/devel:/kubic:/libcontainers:/stable/CentOS_7/devel:kubic:libcontainers:stable.repo -L -o /etc/yum.repos.d/devel:kubic:libcontainers:stable.repo  && \
    INSTALL_PKGS="git podman java-1.8.0-openjdk-devel.x86_64 apache-maven" && \
    yum install -y $INSTALL_PKGS && \
    mkdir -p $HOME/.m2
