pipeline {
    agent any
    stages {
        stage('pull') {
            steps {
                git branch: 'main', url: 'https://github.com/pratikrodi/my_portfolio.git'
                echo "pull success"
            }
        }
        stage('Build') {
            steps {
                echo "Build success"
            }
        }
        stage('Test') {
            steps {
                echo "Testing success"
            }
        }
        stage('Deploy') {
            steps {
                echo "Deploy success"
            }
        }
    }
} 