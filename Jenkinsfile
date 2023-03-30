pipeline {
    environment {
        NEPER_VERSION = 'V4.5.0'
    }
    stages {
        stage('Git Clone') {
            steps {
                sh 'git clone https://github.com/miniluckyant/docker-neper.git -b ${NEPER_VERSION} '
            }
        }
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
                sh 'docker rmi luckyant/docker-neper:${NEPER_VERSION}'
            }
        }

    }
}



