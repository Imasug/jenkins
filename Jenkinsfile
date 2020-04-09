pipeline {

    agent none

    stages {
        stage('Build') {
            steps {
                script {
                    docker.image('jenkins-slave').inside {
                        stage('Maven Build') {
                            dir('/tmp') {
                                sh 'git clone https://github.com/Imasug/multi-wars.git'
                            }
                        }
                    }
                }
            }
        }
    }
}