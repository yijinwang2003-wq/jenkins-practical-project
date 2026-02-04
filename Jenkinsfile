pipeline {
    agent { label 'testing' } 

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('SonarQube Analysis') {
            steps {
                echo "Running SonarQube Scanner..."
                echo "Bugs: 0, Vulnerabilities: 0, Code Smells: 5"
            }
        }

        stage('Quality Gate') {
            steps {
                script {
                    def isPassed = false 
                    if (!isPassed) {
                        error "Quality Gate failed: Code coverage is below 80% and 5 code smells detected."
                    }
                }
            }
        }
        
        stage('Deploy') {
            when {
                branch 'main'
            }
            steps {
                echo "Deploying to production..."
            }
        }
    }
}