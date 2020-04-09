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
                                dir('./multi-wars') {
                                    sh 'sh build.sh'
                                }
                            }
                        }
                        stage('Docker Build') {
                            sh 'echo 1'
                        }
                        stage('Docker Push') {
                            sh 'echo 2'
                        }
                    }
                }
            }
        }
    }
}