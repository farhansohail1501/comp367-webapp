pipeline {
    agent any
    tools {
        maven 'Maven3'
        jdk 'JDK'
    }
    environment {
        DOCKERHUB_CREDENTIALS = credentials('937e9703-dc8d-4252-ae7b-69bf079cad0e')
    }
    stages {
        stage('Checkout') {
            steps {
                // Check out the code from your version control system
                git branch: 'main', url: 'https://github.com/farhansohail1501/comp367-webapp'
            }
        }

        stage('Build Maven Project') {
            steps {
                // Run Maven build
                bat 'mvn clean install'
            }
        }

        stage('Code Coverage') {
            steps {
                // Add code coverage using Jacoco
                bat 'mvn jacoco:report'
            }
        }

        stage('Docker Build') {
            steps {
                // Build Docker image
                bat 'docker build -t sohailfarhan/lab3 .'
            }
        }

        stage('Docker Login') {
            steps {
                // Log in to Docker Hub using credentials
                withCredentials([usernamePassword(credentialsId: '937e9703-dc8d-4252-ae7b-69bf079cad0e', passwordVariable: 'DOCKERHUB_CREDENTIALS_PASSWORD', usernameVariable: 'DOCKERHUB_CREDENTIALS_USERNAME')]) {
                    bat """ docker login --username ${DOCKERHUB_CREDENTIALS_USERNAME} --password ${DOCKERHUB_CREDENTIALS_PASSWORD} """
                }
            }
        }

        stage('Docker Push') {
            steps {
                // Push Docker image to Docker Hub
                bat 'docker push sohailfarhan/lab3'
            }
        }
    }
}


