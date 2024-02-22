pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                script {
                    def mvnHome = tool 'Maven3'
                    sh "${mvnHome}/bin/mvn clean install"
                }
            }
        }
    }
}
