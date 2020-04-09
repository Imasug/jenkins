pipeline {

    agent none

    parameters {
        string(name: 'DOMAIN', defaultValue: 'multi-wars', description: 'Which domain?')
        string(name: 'BRANCH', defaultValue: 'develop', description: 'Which branch?')
    }

    stages {
        stage('test') {
            agent {
                docker {
                    image 'jenkins-slave'
                    args '-v $HOME/.m2:/root/.m2'
                }
            }
            steps {
                sh "ls"
                sh "git clone https://github.com/Imasug/multi-wars.git"
                sh "mvn --version"
                sh "git --version"
                sh "podman -v"
            }
        }
    }
}