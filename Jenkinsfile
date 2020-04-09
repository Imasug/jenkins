pipeline {

    agent {
        docker {
            image 'jenkins-slave'
            args '-v $HOME/.m2:/root/.m2'
        }
    }

    parameters {
        string(name: 'DOMAIN', defaultValue: 'multi-wars', description: 'Which domain?')
        string(name: 'BRANCH', defaultValue: 'develop', description: 'Which branch?')
    }

    stages {
        stage('test') {
            steps {
                sh "mvn --version"
                sh "podman -v"
            }
        }
    }
}