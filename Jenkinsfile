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
                echo "Analyzing code quality for practical-multibranch-project..."
                echo "Reliability Rating: C (Threshold: A)"
            }
        }
        stage('Quality Gate') {
            steps {
                script {
                    error "FAILED: Quality Gate 'Practical_Project_Quality_Gate' failed. Reliability Rating is C. Status: RED."
                }
            }
        }
        stage('Deploy') {
            steps {
                echo "Deployment blocked due to quality standards."
            }
        }
    }
}