pipeline {
    agent none
    stages {
        stage('slave') {
            agent {
                docker {
                    image 'jenkins-slave'
                    args '-u root -v /var/run/docker.sock:/var/run/docker.sock'
                }
            }
            stages {
                stage('test1') {
                    steps {
                        sh 'whoami'
                        sh 'docker images'
                    }
                }
                stage('test2') {
                    steps {
                        sh 'whoami'
                        sh 'docker images'
                    }
                }
            }
        }
    }
}