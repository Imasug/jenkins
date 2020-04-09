pipeline {

    agent none

    stages {
        stage('Build') {
            steps {
                script {
                    docker.image('jenkins-slave').inside {
                        stage('Maven Build') {
                            sh 'cd /tmp && git clone --depth 1 https://github.com/Imasug/multi-wars.git && cd ./multi-wars && sh build.sh'
                        }
                        stage('Docker Build') {
                            sh 'podman build -t multi-wars:latest /tmp/multi-wars'
                        }
                    }
                }
            }
        }
    }
}