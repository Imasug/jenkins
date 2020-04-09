FROM centos:7

RUN yum install -y git

RUN yum install -y java-1.8.0-openjdk
RUN wget https://www-us.apache.org/dist/maven/maven-3/3.6.0/binaries/apache-maven-3.6.0-bin.tar.gz -P /tmp
RUN tar xf /tmp/apache-maven-3.6.0-bin.tar.gz -C /opt
RUN ln -s /opt/apache-maven-3.6.0 /opt/maven
ADD ./mavenenv.sh /etc/profile.d/

RUN curl -L -o /etc/yum.repos.d/devel:kubic:libcontainers:stable.repo https://download.opensuse.org/repositories/devel:/kubic:/libcontainers:/stable/CentOS_7/devel:kubic:libcontainers:stable.repo
RUN yum install -y podman