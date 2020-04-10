def gitRepo = 'https://github.com/Imasug/multi-wars.git'
def contextDir = 'multi-wars';
def buildDir = '.';
def imageTag = 'multi-wars';
def dockerfileDir = '.';
def dockerRepo = '10.212.147.173:8083'
def dockerCredential = 'ocp4-docker-repos'

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
                        sh "docker build -t ${dockerRepo}/${imageTag} /tmp/${contextDir}/${dockerfileDir}"
                    }
                }
                stage('Docker Push') {
                    steps {
                        withCredentials([[$class: 'UsernamePasswordMultiBinding', credentialsId: dockerCredential, usernameVariable: 'username', passwordVariable: 'password']]) {
                            sh "docker login -u ${username} -p ${password} ${dockerRepo} && docker push ${dockerRepo}/${imageTag}"
                        }
                    }
                }
            }
        }
    }
}