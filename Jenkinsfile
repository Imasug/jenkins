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
            agent {
                docker {
                    image 'jenkins-slave'
                    args '-v /var/run/docker.sock:/var/run/docker.sock -v ${HOME}/.m2:/home/jenkins/.m2 -u root'
                }
            }
            steps {
                stage('Maven Build') {
                    sh "cd /tmp && git clone -b ${params.BRANCH} --depth 1 ${gitRepo} && cd ${contextDir}/${buildDir} && sh build.sh"
                }
                stage('Docker Build') {
                    sh "docker build -t ${image} /tmp/${contextDir}/${dockerfileDir}"
                }
                stage('Docker Push') {
                }
            }
        }
    }
}