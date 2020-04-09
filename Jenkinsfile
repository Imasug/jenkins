pipeline {

    agent none

    stages {
        stage('Maven Build') {
            steps {
                script {
                    docker.image('jenkins-slave').inside {
                        sh 'cd /tmp; git clone https://github.com/Imasug/multi-wars.git'
                    }
                }
            }
        }
    }
}