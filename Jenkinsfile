pipeline {
    agent any
    
    tools {
        maven 'Maven3'
        jdk 'JDK'
    }
    
    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/farhansohail1501/comp367-webapp'
            }
        }
        stage('Build') {
            steps {
                bat 'mvn -Dmaven.test.failure.ingore=true clean package'
            }
        }
    }
}
