pipeline {
    agent { label 'testing' }
    stages {
        stage('Build') {
            steps {
                echo "Building on branch: ${env.BRANCH_NAME}"
            }
        }
        stage('Test') {
            when {
                branch 'feature*'
            }
            steps {
                echo "Running special tests for feature branch..."
            }
        }
        stage('Deploy') {
            when {
                branch 'main'
            }
            steps {
                echo "Deploying main branch to staging..."
            }
        }
    }
}
