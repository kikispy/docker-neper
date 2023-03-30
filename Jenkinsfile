pipeline {
    agent any
    environment {
        NEPER_VERSION = 'v4.5.0'
    }
    stages {
        stage('Docker Build') {
            steps {
                sh 'docker build -t luckyant/docker-neper:${NEPER_VERSION} .'
            }
        }
        stage('Docker Push') {
            steps {
                sh 'docker push luckyant/docker-neper:${NEPER_VERSION} --max-concurrent-uploads 1'
            }
        }
        stage('Docker Remove') {
            steps {
                sh '''docker rmi luckyant/docker-neper:${NEPER_VERSION};docker rmi $(docker images -qf "dangling=true")'''
            }
        }

    }
}



