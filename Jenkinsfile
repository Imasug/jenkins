def gitRepo = 'https://github.com/Imasug/multi-wars.git'
def contextDir = 'multi-wars';
def buildDir = '.';

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
                    args '-u root -v /var/run/docker.sock:/var/run/docker.sock -v $HOME/.m2:/home/jenkins/.m2'
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
                        sh "whoami"
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