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
                sh "sonar-scanner -Dsonar.projectKey=practical-multibranch-project -Dsonar.sources=. -Dsonar.host.url=http://localhost:9000 -Dsonar.login=替换成你刚刚复制的TOKEN"
            }
        }

        stage('Quality Gate') {
            steps {
                script {
                    error "FAILED: Quality Gate requirements not met. Standards violated."
                }
            }
        }
    }
}