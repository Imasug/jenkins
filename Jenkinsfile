pipeline {
    agent none
    stages {
        stage('Back-end') {
            agent {
                docker { image 'jenkins-slave' }
            }
            steps {
                sh 'mvn --version'
            }
        }
    }
}