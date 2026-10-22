pipeline {
    agent {
        // Runs the pipeline on a Jenkins agent with the label 'node1'
        label 'node1'
    }
    
    tools {
        // Must match the name configured in your Jenkins Global Tool Configuration
        nodejs 'node-20' 
    }
    
    environment {
        // Disables Next.js telemetry data collection during CI builds
        NEXT_TELEMETRY_DISABLED = '1'
        // Forces npm scripts to run in non-interactive CI mode
        CI = 'true'
    }
    
    stages {
        stage('Pull') {
            steps {
                git branch: 'main', url: 'https://github.com/pratikrodi/my_portfolio.git'
                echo "Pull success"
            }
        }
        
        stage('Install Dependencies') {
            steps {
                echo "Installing exact dependencies from package-lock.json..."
                sh 'npm ci'
            }
        }
        
        stage('Test') {
            steps {
                echo "Running application tests..."
                // Runs tests in a non-watching, single-pass execution block
                sh 'npm test -- --watchAll=false --passWithNoTests'
            }
        }
        
        stage('Build') {
            steps {
                echo "Compiling Next.js application..."
                // Builds your production assets into the .next/ directory
                sh 'npm run build'
                echo "Build success"
            }
        }
        
        stage('Deploy') {
            steps {
                echo "Deploying production build..."
                // TODO: Add your deployment steps here (e.g., AWS S3, Vercel CLI, Docker push)
                echo "Deploy success"
            }
        }
    }
    
    post {
        always {
            echo "Pipeline complete."
        }
    }
} 
