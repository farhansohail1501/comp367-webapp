pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                script {
                    def mvnHome = tool 'Maven'
                    sh "${mvnHome}/bin/mvn clean install"
                }
            }
        }
    }
}
