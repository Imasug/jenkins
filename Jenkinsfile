pipeline {

    agent none

    stages {
        stage('Build') {
            steps {
                script {
                    docker.image('jenkins-slave').inside {
                        stage('Maven Build') {
                            sh 'cd /tmp && git clone https://github.com/Imasug/multi-wars.git && cd ./multi-wars && sh build.sh'
                        }
                    }
                }
            }
        }
    }
}