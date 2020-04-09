node {
    docker.image('jenkins-slave').inside('-v $HOME/.m2 /root/.m2') {
        sh "ls -A ."
        sh "podman -v"
    }
}