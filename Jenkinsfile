pipeline {
    agent any
    environment {
        DOCKER_TAG = dockerTag()
    }

    stages{
        stage("Docker Build"){
            steps{
                sh "docker build dhr70/jenNodeApp:${DOCKER_TAG}"
            }

        }
    }
}

def dockerTag(){
        def tag = sh script: 'git rev-prase HEAD', returnStdout: true
        return tag
}
