pipeline {

    agent none

    stages {
        stage('Build') {
            steps {
                script {
                    docker.image('jenkins-slave').inside('-v /var/run/docker.sock:/var/run/docker.sock') {
                        stage('Maven Build') {
                            sh 'ls -A $HOME/.m2'
                            sh 'id'
                            sh 'cd /tmp && git clone --depth 1 https://github.com/Imasug/multi-wars.git && cd ./multi-wars && sh build.sh'
                            sh 'ls -A $HOME/.m2'
                        }
                        // stage('Docker Build') {
                        //     docker.build('multi-wars', '/tmp/multi-wars')
                        // }
                    }
                }
            }
        }
    }
}