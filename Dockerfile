FROM centos:8

# Install
RUN dnf -y module disable container-tools && \
    dnf -y install 'dnf-command(copr)' && \
    dnf -y copr enable rhcontainerbot/container-selinux && \
    curl -L -o /etc/yum.repos.d/devel:kubic:libcontainers:stable.repo https://download.opensuse.org/repositories/devel:/kubic:/libcontainers:/stable/CentOS_8/devel:kubic:libcontainers:stable.repo && \
    INSTALL_PKGS="git podman maven" && \
    dnf -y install $INSTALL_PKGS && \
    mkdir -p $HOME/.m2
