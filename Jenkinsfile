pipeline {
    agent none
    stages {
        stage('Back-end') {
            agent {
                docker { image 'jenkins-slave' }
            }
            steps {
                stages {
                    stage('test') {
                        sh 'test'
                    }
                }
            }
        }
    }
}