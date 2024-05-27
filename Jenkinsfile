pipeline {
    agent any
    
    environment {
        dockerImage = ''
        registry = 'adarsh623/mypythonapp:v1'
        registryCredential ='dockerhub-id'
    }
    stages{
        stage('code checkout'){
            steps{
                checkout scmGit(branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/Adarsh623/mypythonRepo.git']])
            }
        }
        stage('build docker image'){
            steps {
                script {
                    dockerImage = docker.build registry
                }    
            }
        }
        stage('upload it to docker hub'){
            steps {
                script{
                        docker.withRegistry( '', registryCredential ) {
                        dockerImage.push()
                        }
                }
            }
        }
    }
}
