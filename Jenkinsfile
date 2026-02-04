pipeline {
    agent { label 'testing' } 

    stages {
        stage('Build & Unit Test') {
            steps {
                echo "Building on branch: ${env.BRANCH_NAME}"
                echo "Running standard unit tests..."
            }
        }

        stage('Feature Branch Integration Test') {
            when {
                branch 'feature*' 
            }
            steps {
                echo "Detected feature branch. Running integration tests..."
            }
        }

        stage('Deploy to Staging') {
            when {
                branch 'main'
            }
            steps {
                echo "Detected main branch. Deploying to staging database..."
            }
        }
    }
}