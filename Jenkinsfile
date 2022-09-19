pipeline {
    agent any
    environment {
        DOCKER_TAG = dockerTag()
    }

    stages{
        stage("Docker Build"){
            steps{
                sh "docker build . -t dhr70/jen-node-app:${DOCKER_TAG} "
            }

        }
    }
}

def dockerTag(){
        def tag = sh script: 'git rev-parse HEAD', returnStdout: true
        return tag
}
