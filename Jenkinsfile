currentBuild.displayName = "k8s-jenkins-#"+currentBuild.number
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
                sh "echo $DOCKERHUB_PSW| docker login -u $DOCKERHUB_USR --password-stdin"
                sh "docker push dhr70/jen-node-app:${DOCKER_TAG}"
                sh "docker logout"
            }
        
        }

        stage("Deploy to k8s"){
            steps{
                sh "chmod +x tagVersion.sh"
                sh "./tagVersion.sh ${DOCKER_TAG}"
            }

        }
    }
}

def dockerTag(){
        def tag = sh script: 'git rev-parse HEAD', returnStdout: true
        return tag
}
