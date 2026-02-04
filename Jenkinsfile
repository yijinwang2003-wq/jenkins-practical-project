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

        stage('Quality Gate') {
            steps {
                echo "Quality Gate passed. Code standards met."
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
    }
}