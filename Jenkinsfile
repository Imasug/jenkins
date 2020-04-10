pipeline {
    agent none
    stages {
        stage('Master') {
            agent any
            steps {
                sh 'if [ -e $HOME/.m2/test ]; then mkdir $HOME/.m2/test && chown jenkins:jenkins $HOME/.m2/test && ls -l $HOME/.m2/test; fi'
            }
        }
        stage('Slave') {
            steps {
                script {
                    docker.image('jenkins-slave').inside('-v /var/run/docker.sock:/var/run/docker.sock -v $HOME/.m2/test:/home/jenkins/.m2') {
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