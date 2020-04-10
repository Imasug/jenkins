pipeline {
    agent none
    stages {
        stage('Slave') {
            agent {
                docker {
                    image 'jenkins-slave'
                    args '-u root'
                }
            }
            stages {
                stage('test') {
                    steps {
                        sh 'docker images'
                    }
                }
            }
        }
    }
}