pipeline {
    agent any
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
                bat 'git clone https://github.com/Shivansh1711/E-commerce-web.git .'
            }
        }
        stage('Clear previous Builds') {
            steps {
                bat 'docker compose down'
            }
        }
        stage('Docker Compose') {
            steps {
                bat 'docker compose up -d --build'
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
}
