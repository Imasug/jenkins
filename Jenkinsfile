def gitRepo = 'https://github.com/Imasug/multi-wars.git'

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
                        sh "cd /tmp && git clone -b ${params.BRANCH} --depth 1 ${gitRepo}"
                    }
                }
                stage('Docker Build') {
                    steps {
                        sh 'whoami'
                        sh 'docker images'
                    }
                }
                stage('Docker Push') {
                    steps {
                        sh 'whoami'
                        sh 'docker images'
                    }
                }
            }
        }
    }
}