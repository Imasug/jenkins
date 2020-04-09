pipeline {
    agent none

    parameters {
        string(name: "DOMAIN", defaultValue: "multi-wars", description: "Which domain?")
        string(name: "BRANCH", defaultValue: "develop", description: "Which branch?")
    }

    stages {
        stage("Slave") {
            agent {
                docker {
                    image "jenkins-slave"
                    args "-v $HOME/.m2:/root/.m2"
                }
            }
            stages {
                stage("Maven Build") {
                    steps {
                        sh "git clone -b ${params.BRANCH} --depth 1 https://github.com/Imasug/${params.DOMAIN}.git"
                        // TODO
                        sh "cd ${params.DOMAIN} && sh build.sh"
                    }
                }
                stage("Docker Build") {
                    steps {
                        sh "podman build -t ${params.DOMAIN}:latest ./${params.DOMAIN}"
                    }
                }
                stage("Docker Push") {
                    steps {
                        // TODO
                        sh "echo 'Docker Push'"
                    }
                }
            }
        }
    }
}