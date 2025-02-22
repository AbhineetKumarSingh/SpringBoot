pipeline {
    agent any   // Run on any available agent

    environment {
        JAVA_HOME = 'C:/Program Files/Java/jdk-17'
        MAVEN_HOME = 'H:/SOFTWARE/Maven'
        PATH = "${JAVA_HOME}/bin:${MAVEN_HOME}/bin:${env.PATH}"
        DOCKER_IMAGE = "my-spring-app"   // Docker Image Name
        DOCKER_CONTAINER = "spring-container"
        REGISTRY = "abhineetsingh1902"         // Docker Hub username (replace with yours)
        REGISTRY_CREDENTIALS = "Abhineetks#1902"  // Credentials ID in Jenkins
    }

    stages {
        stage('Checkout Code') {
            steps {
                git branch: 'main', url: 'https://github.com/AbhineetKumarSingh/SpringBoot.git'
            }
        }

        stage('Build with Maven') {
            steps {
                bat 'mvn clean package'  // Runs on Windows
            }
        }

        stage('Build Docker Image') {
            steps {
                bat "docker build -t ${DOCKER_IMAGE}:latest ."
            }
        }

        stage('Push Docker Image to Docker Hub') {
            steps {
                withDockerRegistry([credentialsId: REGISTRY_CREDENTIALS, url: ""]) {
                    bat "docker tag ${DOCKER_IMAGE}:latest ${REGISTRY}/${DOCKER_IMAGE}:latest"
                    bat "docker push ${REGISTRY}/${DOCKER_IMAGE}:latest"
                }
            }
        }

        stage('Deploy Docker Container') {
            steps {
                bat "docker stop ${DOCKER_CONTAINER} || exit 0"
                bat "docker rm ${DOCKER_CONTAINER} || exit 0"
                bat "docker run -d -p 8080:8090 --name ${DOCKER_CONTAINER} ${DOCKER_IMAGE}:latest"
            }
        }
    }

    post {
        always {
            echo 'Pipeline execution completed.'
        }
        success {
            echo 'Pipeline executed successfully!'
        }
        failure {
            echo 'Pipeline execution failed!'
        }
    }
}
