pipeline {
    agent any

    environment {
        DOCKERHUB_USERNAME = 'pawank7390'                         
        IMAGE_NAME = 'flask-app-pawank'                           
        DOCKER_CREDENTIALS_ID = 'dockerhub-creds'                
    }

    stages {
        stage('Checkout Code') {
            steps {
                echo 'Cloning repository...'
                git branch: 'master', url: 'https://github.com/PawanK7390/Q2-flask-app.git'
            }
        }

        stage('Docker Login') {
            steps {
                echo 'Logging into Docker Hub...'
                withCredentials([usernamePassword(credentialsId: "${DOCKER_CREDENTIALS_ID}", usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD')]) {
                    bat 'echo %PASSWORD% | docker login -u %USERNAME% --password-stdin'
                }
            }
        }

        stage('Build Docker Image') {
            steps {
                echo 'Building Docker image...'
                bat "docker build -t %DOCKERHUB_USERNAME%/%IMAGE_NAME%:latest ."
            }
        }

        stage('Push Docker Image') {
            steps {
                echo 'Pushing image to Docker Hub...'
                bat "docker push %DOCKERHUB_USERNAME%/%IMAGE_NAME%:latest"
            }
        }
    }

    post {
        success {
            echo ' Docker image built and pushed successfully!'
        }
        failure {
            echo ' Pipeline failed.'
        }
    }
}
