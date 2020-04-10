pipeline {
    agent none
    stages {
        stage('Slave') {
            agent {
                docker {
                    image 'jenkins-slave'
                    args '-u root -v /var/run/docker.sock:/var/run/docker.sock'
                }
            }
            stages {
                stage('test') {
                    steps {
                        sh 'whoami'
                        sh 'docker images'
                    }
                }
                stage('test') {
                    steps {
                        sh 'whoami'
                        sh 'docker images'
                    }
                }
            }
        }
    }
}