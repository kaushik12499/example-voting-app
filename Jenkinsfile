pipeline{
    agent any
    stages{
        stage('Checkout SCM'){
            steps{
                git url: 'https://github.com/kaushik12499/example-voting-app.git'
            }
        }
        stage('Docker'){
            steps{
                sh "ansible playbook azure-docker.yml"
            }
        }
        stage('Kubernetes and minikube'){
            steps{
                sh "ansible playbook minikube.yml"
            }
        }
        stage('Deploy'){
            steps{
                sh "ansible playbook ansible-minikube.yml"
            }
        }  
        }
}
