pipeline {
    agent none
    stages {
        stage('Slave') {
            agent {
                docker { image 'jenkins-slave' }
            }
            stages {
                stage('Maven') {
                    steps {
                        sh 'id'
                        sh 'pwd'
                        sh 'mvn --version'
                    }
                }
                stage('Docker') {
                    steps {
                        sh 'docker --version'
                    }
                }
            }
        }
    }
}