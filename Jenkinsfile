pipeline {
    agent none
    stages {
        stage('Master') {
            agent any
            steps {
                dir('test') {
                    sh 'pwd'
                }
                dir('../test') {
                    sh 'pwd'
                }
            }
        }
        stage('Slave') {
            steps {
                script {
                    docker.image('jenkins-slave').inside('-v /var/run/docker.sock:/var/run/docker.sock -v repo:/home/jenkins/.m2') {
                        stage('Maven Build') {
                            sh 'cd /tmp && git clone --depth 1 https://github.com/Imasug/multi-wars.git && cd ./multi-wars && sh build.sh'
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