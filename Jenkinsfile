pipeline {
    agent any
    environment {
        DOCKER_TAG = dockerTag()
        DOCKERHUB = credentials('dockerhub')

    }

    stages{
        stage("Docker Build"){
            steps{
                sh "docker build . -t dhr70/jen-node-app:${DOCKER_TAG} "
            }
        }
        stage("DockerHub Push Images"){
            steps{
                sh "h 'echo $DOCKERHUB_PSW | docker login -u $DOCKERHUB --password-stdin"
            }
        

        }
    }
}

def dockerTag(){
        def tag = sh script: 'git rev-parse HEAD', returnStdout: true
        return tag
}
