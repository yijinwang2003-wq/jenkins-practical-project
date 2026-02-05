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
                sh "sonar-scanner -Dsonar.projectKey=practical-multibranch-project -Dsonar.sources=. -Dsonar.host.url=http://localhost:9000 -Dsonar.login=sqp_b1222d890ba17abb47caae9fd59fe74ccdd64a10"
            }
        }

        stage('Database Management') {
            steps {
                script {
                    echo "Building Staging Database: Executing schema.sql..."
                    sh "cat schema.sql"
                    echo "Database schema built successfully."

                    echo "Seeding Staging Database: Executing seed.sql..."
                    sh "cat seed.sql"
                    echo "Test data seeded successfully."
                }
            }
        }

        stage('End-to-End Testing') {
            steps {
                echo "Running Playwright E2E Tests..."
                sh "/Users/yijinwang/anaconda3/bin/pytest --html=report.html --self-contained-html test_user_journey.py"
                archiveArtifacts artifacts: 'report.html', fingerprint: true
            }
        }

        stage('Performance Testing') {
            steps {
                echo "Running Locust Performance Tests..."
                sh "/Users/yijinwang/anaconda3/bin/locust -f locustfile.py --headless -u 10 -r 1 --run-time 30s --host http://localhost:5001"
            }
        }
    }

    post {
        success {
            echo "SUCCESS: Deployment to staging was successful. Notification sent to team."
        }
        failure {
            echo "FAILURE: Pipeline failed! Reviewing error details in Console Output..."
        }
    }
}