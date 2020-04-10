pipeline {
    agent none
    stages {
        stage('Jenkins Slave') {
            agent {
                docker {
                    image 'jenkins-slave'
                    args '-u root -v /var/run/docker.sock:/var/run/docker.sock -v .m2:/home/jenkins/.m2'
                }
            }
            stages {
                stage('Maven Build') {
                    steps {
                        sh 'whoami'
                        sh 'docker images'
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