pipeline {
    agent { label 'testing' } 

    options {
        buildDiscarder(logRotator(numToKeepStr: '10', artifactNumToKeepStr: '10'))
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Build & Package') {
            steps {
                echo "Starting Build Version: 1.0.${BUILD_NUMBER}"
                sh """
                    mkdir -p ./build
                    echo "Build Version: 1.0.${BUILD_NUMBER}" > ./build/version_info.txt
                    tar -cvf ./build/quant-app-v1.0.${BUILD_NUMBER}.tar app.py ./build/version_info.txt
                """
                echo "Artifact created: ./build/quant-app-v1.0.${BUILD_NUMBER}.tar"
            }
        }

        stage('Archive Artifacts') {
            steps {
                archiveArtifacts artifacts: '**/build/*.tar', fingerprint: true
            }
        }
    }
}