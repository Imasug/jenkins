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
        stage('Jenkins Slave') {
            agent {
                docker {
                    image 'jenkins-slave'
                    args '-u root -v /var/run/docker.sock:/var/run/docker.sock -v .m2:/home/jenkins/.m2'
                }
            }
            stages {
                stage('Maven Build') {
                    steps {
                        sh "cd /tmp && git clone -b ${params.BRANCH} --depth 1 ${gitRepo} && cd ${contextDir}/${buildDir} && sh build.sh"
                    }
                }
                stage('Docker Build') {
                    steps {
                        sh 'whoami'
                    }
                }
                stage('Docker Push') {
                    steps {
                        sh 'whoami'
                    }
                }
            }
        }
    }
}