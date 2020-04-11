def GIT_REPO = 'https://github.com/Imasug/multi-wars.git'
def CONTEXT_DIR = 'multi-wars';
def BUILD_SCRIPT_DIR = '.';
def IMAGE_TAG = 'multi-wars';
def DOCKERFILE_DIR = '.';
def DOCKER_REPO = '10.212.147.173:8083'
def DOCKER_REPO_CRED = 'ocp4-docker-repos'

pipeline {
    agent none
    parameters {
        string(name: 'BRANCH', defaultValue: 'develop', description: 'Which branch?')
    }
    stages {
        stage('Jenkins Master') {
            agent any
            stages {
                stage('Init') {
                    steps {
                        dir('repo') {
                            sh 'pwd'
                        }
                    }
                }
            }
        }
        stage('Jenkins Slave') {
            agent {
                docker {
                    image 'jenkins-slave'
                    args '-u root -v /var/run/docker.sock:/var/run/docker.sock -v repo:/home/jenkins/.m2'
                }
            }
            stages {
                stage('Maven Build') {
                    steps {
                        sh "cd /tmp && git clone -b ${params.BRANCH} --depth 1 ${GIT_REPO} && cd ${CONTEXT_DIR}/${BUILD_SCRIPT_DIR} && sh build.sh"
                    }
                }
                stage('Docker Build') {
                    steps {
                        sh "docker build -t ${DOCKER_REPO}/${IMAGE_TAG} /tmp/${CONTEXT_DIR}/${DOCKERFILE_DIR}"
                    }
                }
                stage('Docker Push') {
                    steps {
                        withCredentials([[$class: 'UsernamePasswordMultiBinding', credentialsId: DOCKER_REPO_CRED, usernameVariable: 'username', passwordVariable: 'password']]) {
                            sh "docker login -u ${username} -p ${password} ${DOCKER_REPO} && docker push ${DOCKER_REPO}/${IMAGE_TAG}"
                        }
                    }
                }
            }
        }
    }
}