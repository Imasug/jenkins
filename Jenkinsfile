def gitRepo = 'https://github.com/Imasug/multi-wars.git'
def contextDir = 'multi-wars';
def image = 'multi-wars';
def buildDir = '.';
def dockerfileDir = '.';

def dockerRepo = 'http://10.212.147.173:8083'
def dockerCredential = 'ocp4-docker-repos'

def imageObj = '';

pipeline {
    agent none
    parameters {
        string(name: 'BRANCH', defaultValue: 'develop', description: 'Which branch?')
    }
    stages {
        stage('Slave') {
            steps {
                script {
                    docker.image('jenkins-slave').inside('-v /var/run/docker.sock:/var/run/docker.sock -v ${HOME}/.m2:/home/jenkins/.m2') {
                        stage('Maven Build') {
                            sh "cd /tmp && git clone -b ${params.BRANCH} --depth 1 ${gitRepo} && cd ${contextDir}/${buildDir} && sh build.sh"
                        }
                        stage('Docker Build') {
                            imageObj = docker.build("${image}", "/tmp/${contextDir}/${dockerfileDir}");
                        }
                        stage('Docker Push') {
                            docker.withRegistry(dockerRepo, dockerCredential) {
                                imageObj.push()
                            }
                        }
                    }
                }
            }
        }
    }
}