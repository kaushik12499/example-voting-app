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
                sh "sudo ansible-playbook azure-docker.yml"
            }
        }
        stage('Kubernetes and minikube'){
            steps{
                sh "sudo ansible-playbook minikube.yml"
            }
        }
        stage('Deploy'){
            steps{
                sh "sudo ansible-playbook ansible-minikube.yml"
            }
        }  
        }
}
