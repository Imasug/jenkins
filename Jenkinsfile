def repo = 'https://github.com/Imasug/multi-wars.git'
def contextDir = 'multi-wars';
def image = 'multi-wars';
def buildDir = '.';
def dockerfileDir = '.';

pipeline {
    agent none
    stages {
        stage('Slave') {
            steps {
                script {
                    docker.image('jenkins-slave').inside('-v /var/run/docker.sock:/var/run/docker.sock -v ${HOME}/.m2:/home/jenkins/.m2') {
                        stage('Maven Build') {
                            sh "cd /tmp && git clone --depth 1 ${repo} && sh ${contextDir}/${buildDir}/build.sh"
                        }
                        stage('Docker Build') {
                            docker.build("${image}", "/tmp/${contextDir}/${dockerfileDir}")
                        }
                    }
                }
            }
        }
    }
}