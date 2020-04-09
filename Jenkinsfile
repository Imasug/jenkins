pipeline {
    agent any
    stages {
        stage("build") {
            steps {
                sh "mvn --version"
                sh "git clone --depth 1 https://github.com/Imasug/multi-wars.git"
                sh "cd multi-wars && sh build.sh"
            }
        }
    }
}