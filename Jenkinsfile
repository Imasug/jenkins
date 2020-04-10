pipeline {

    agent none

    stages {
        stage('Build') {
            steps {
                script {
                    docker.image('jenkins-slave').inside('-v /var/run/docker.sock:/var/run/docker.sock') {
                        stage('Maven Build') {
                            sh "docker images"
                        }
                    }
                }
            }
        }
    }
}