pipeline {
    agent none
    stages {
        stage('Slave') {
            agent {
                docker { image 'jenkins-slave' }
            }
            stages {
                stage('test') {
                    step {
                        sh 'docker images'
                    }
                }
            }
        }
    }
}