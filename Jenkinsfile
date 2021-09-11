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
                sh "`gen-hosts-list $env` > /home/azureuser/example-voting-app/hosts"
                sh "ansible-playbook -i hosts azure-docker.yml -u AUTO_USER --private-key=/home/azureuser/.ssh/id_rsa"
            }
        }
        stage('Kubernetes and minikube'){
            steps{
                sh "ansible-playbook -i hosts minikube.yml -u AUTO_USER --private-key=/home/azureuser/.ssh/id_rsa"
            }
        }
        stage('Deploy'){
            steps{
                sh "ansible-playbook -i hosts ansible-minikube.yml -u AUTO_USER --private-key=/home/azureuser/.ssh/id_rsa"
            }
        }  
        }
}
