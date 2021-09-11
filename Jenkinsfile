pipeline{
    agent any
    stages{
        stage('Checkout SCM'){
            steps{
                git url: 'https://github.com/kaushik12499/example-voting-app.git'
            }
        }
        stage('Kubernetes and minikube'){
            steps{
                sh "ansible-playbook -i hosts minikube.yml"
            }
        }
        stage('Deploy'){
            steps{
                sh "ansible-playbook -i hosts ansible-minikube.yml"
            }
        }  
        }
}
