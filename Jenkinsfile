pipeline {
    agent none
    stages {
        stage('Slave') {
            agent {
                docker { image 'jenkins-slave' }
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