pipeline {
    agent any
    
    environment {
        dockerImage = ''
        registry = 'adarsh623/mypythonapp:v1'
        //registry='adarsh623/mypythonapp1'
        registryCredential ='dockerhub-id'
    }
    stages{
        stage('code checkout'){
            steps{
                checkout scmGit(branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/Adarsh623/pythonapp.git']])
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
        stage('Docker pull'){
            steps {
                sh 'docker pull adarsh623/mypythonapp:v1'
                sh 'docker run -d --name python-app-v1 -p 5000:5000 adarsh623/mypythonapp:v1'
            }
        }
    }
}
