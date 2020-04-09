pipeline {
    // TODO agent to container
    agent any

    parameters {
        string(name: "BRANCH", defaultValue: "develop", description: "Which branch?")
    }

    stages {
        stage("Maven Build") {
            steps {
                sh "mvn --version"
                // TODO
                sh "rm -rf multi-wars"
                sh "git clone --depth 1 https://github.com/Imasug/multi-wars.git"
                sh "git checkout ${params.BRANCH}"
                sh "cd multi-wars && sh build.sh"
            }
        }
        stage("Docker Build") {
            steps {
                sh "docker build -t multi-wars:latest ./multi-wars"
            }
        }
        stage("Docker push") {
            steps {
                // TODO
                sh "echo docker push"
            }
        }
    }
}