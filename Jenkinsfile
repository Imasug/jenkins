pipeline {
    // TODO agent to container
    agent any
    stages {
        stage("mvn build") {
            steps {
                sh "mvn --version"
                // TODO
                sh "rm -rf multi-wars"
                sh "git clone --depth 1 https://github.com/Imasug/multi-wars.git"
                sh "cd multi-wars && sh build.sh"
            }
        }
        stage("docker build") {
            staps {
                sh "docker build multi-wars:latest ./multi-wars"
            }
        }
    }
}