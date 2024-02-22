pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                script {
                    def mvnHome = tool 'Maven3'
                    withEnv(["PATH+MAVEN=${mvnHome}\\bin"]) {
                        sh 'mvn clean install'
                    }
                }
            }
        }
    }
}

