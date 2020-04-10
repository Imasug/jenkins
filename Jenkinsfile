pipeline {
    agent none
    stages {
        stage('Slave') {
            agent {
                docker { image 'jenkins-slave' }
            }
            stages {
                stage('test') {
                    sh 'docker images'
                }
            }
        }
    }
}