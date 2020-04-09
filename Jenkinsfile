node {
    docker.image('jenkins-slave').inside('-v $HOME/.m2:/root/.m2') {
        sh "podman -v && whoami && pwd && ls -A /root/"
    }
}