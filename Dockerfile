FROM centos:7

RUN yum install -y java-1.8.0-openjdk
ENV JAVA_HOME /usr/lib/jvm/jre-openjdk

RUN curl -OL https://archive.apache.org/dist/maven/maven-3/3.5.2/binaries/apache-maven-3.5.2-bin.tar.gz
RUN tar -xzvf apache-maven-3.5.2-bin.tar.gz
RUN mv apache-maven-3.5.2 /opt/
RUN ln -s /opt/apache-maven-3.5.2 /opt/apache-maven
ENV PATH $PATH:/opt/apache-maven/bin

RUN yum install -y git

RUN curl -L -o /etc/yum.repos.d/devel:kubic:libcontainers:stable.repo https://download.opensuse.org/repositories/devel:/kubic:/libcontainers:/stable/CentOS_7/devel:kubic:libcontainers:stable.repo
RUN yum install -y podman