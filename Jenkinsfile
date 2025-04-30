pipeline {
    agent any
    environment {
        DOCKER_COMPOSE_FILE = 'docker-compose.yml'
    }
    stages {
        stage('Cleanup') {
            steps {
                script {
                    deleteDir()
                }
            }
        }
        stage('Git Clone') {
            steps {
                git 'https://github.com/Shivansh1711/E-commerce-web.git'
            }
        }
        stage('Clear previous Builds') {
            steps {
                script {
                    // Ensure the docker-compose.yml is present before proceeding
                    if (fileExists(DOCKER_COMPOSE_FILE)) {
                        bat 'docker-compose -f docker-compose.yml down || exit 0'
                    } else {
                        error "docker-compose.yml not found."
                    }
                }
            }
        }
        stage('Docker Compose') {
            steps {
                script {
                    // Ensure the docker-compose.yml is present before proceeding
                    if (fileExists(DOCKER_COMPOSE_FILE)) {
                        bat 'docker-compose -f docker-compose.yml up -d --build || exit 0'
                    } else {
                        error "docker-compose.yml not found."
                    }
                }
            }
        }
        stage('Testing') {
            steps {
                script {
                    // Example: health check or basic test
                    bat 'curl http://localhost:3000 || exit 1'
                }
            }
        }
    }
    post {
        always {
            script {
                if (fileExists(DOCKER_COMPOSE_FILE)) {
                    bat 'docker-compose -f docker-compose.yml down || exit 0'
                } else {
                    echo 'docker-compose.yml not found, skipping cleanup.'
                }
            }
        }
    }
}
