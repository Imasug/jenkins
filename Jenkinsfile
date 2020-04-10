pipeline {
    agent none
    stages {
        stage('Slave') {
            agent {
                docker { image 'jenkins-slave' }
            }
            steps {
                sh 'pwd'
                sh 'docker images'
            }
        }
    }
}