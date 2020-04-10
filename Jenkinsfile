pipeline {
    agent none
    stages {
        stage('Back-end') {
            agent {
                docker { image 'jenkins-slave' }
            }
            stages {
                stage('test') {
                    steps {
                        sh 'echo test'
                    }
                }
            }
        }
    }
}