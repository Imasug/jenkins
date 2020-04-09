pipeline {
    agent {
        docker {
            image "registry.access.redhat.com/openshift3/jenkins-slave-maven-rhel7"
        }
    }
    stages {
        stage("build") {
            steps {
                sh "mvn --version"
                sh "git clone --depth 1 https://github.com/Imasug/multi-wars.git"
                sh "ls"
            }
        }
    }
}