pipeline {
    agent any

    tools {
        git 'Default'  // Ensure Git is available
    }

    environment {
        DOCKER_BUILDKIT = 1
    }

    stages {
        stage('Cleanup') {
            steps {
                script {
                    bat 'docker compose down || exit 0'
                    bat 'docker system prune -f || exit 0'
                    deleteDir()
                }
            }
        }

        stage('Git Clone') {
            steps {
                echo 'Source code already checked out by Jenkins.'
            }
        }

        stage('Build & Run with Docker Compose') {
            steps {
                bat 'docker compose -f docker-compose.yml up -d --build'
            }
        }

        stage('Testing') {
            steps {
                bat '''
                    timeout /t 10
                    curl http://localhost:3000 || exit 1
                '''
            }
        }
    }

    post {
        always {
            echo "Tearing down containers after build..."
            bat 'docker compose down || exit 0'
        }
    }
}
