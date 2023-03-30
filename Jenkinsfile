pipeline {
    agent any
    environment {
        NEPER_VERSION = 'latest'
    }
    stages {
        stage('Docker Build') {
            steps {
                sh 'docker build -t luckyant/docker-neper:${NEPER_VERSION} .'
            }
        }
        stage('Docker Push') {
            steps {
                sh 'docker push luckyant/docker-neper:${NEPER_VERSION}'
            }
        }
        stage('Docker Remove') {
            steps {
                sh '''
                docker images | grep docker-neper && docker rmi luckyant/docker-neper:${NEPER_VERSION} || echo "Nothing to do"
                docker images | grep none && docker rmi $(docker images -qf "dangling=true") || echo "Nothing to do"
                '''
            }
        }

    }
}



