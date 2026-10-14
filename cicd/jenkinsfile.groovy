pipeline {
    agent any
    stages {
        stage('pull') {
            steps {
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