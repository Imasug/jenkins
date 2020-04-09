pipeline {
    // TODO agent to container
    agent any

    parameters {
        string(name: "DOMAIN", defaultValue: "multi-wars", description: "Which domain?")
        string(name: "BRANCH", defaultValue: "develop", description: "Which branch?")
    }

    stages {
        stage("Maven Build") {
            steps {
                sh "mvn --version"
                // TODO
                sh "rm -rf ${params.DOMAIN}"
                sh "git clone -b ${params.BRANCH} --depth 1 https://github.com/Imasug/${params.DOMAIN}.git"
                sh "cd ${params.DOMAIN} && sh build.sh"
            }
        }
        stage("Docker Build") {
            steps {
                sh "docker build -t ${params.DOMAIN}:latest ./${params.DOMAIN}"
            }
        }
        stage("Docker push") {
            steps {
                // TODO
                sh "echo docker push"
            }
        }
        stage("test") {
            agent {
                docker "jenkins-slave"
            }
            steps {
                sh "git --version"
                sh "mvn --version"
            }
        }
    }
}