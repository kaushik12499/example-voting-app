pipeline{
    agent any
    stages{
        stage('Checkout SCM'){
            steps{
                git url: 'https://github.com/kaushik12499/example-voting-app.git'
            }
        }
        stage('SonarQube'){
            steps{
            script {
              scannerHome = tool 'Example-voting-app'
            }
            withSonarQubeEnv('Example-voting-app') {
             sh "${scannerHome}/bin/sonar-scanner \
             -D sonar.login=admin \
             -D sonar.password=kaushik \
             -D sonar.projectKey=Example-voting-app"
            }
          }
        }
         stage('Docker'){
            steps{
                sh "ansible-playbook -i hosts azure-docker.yml"
                sh "sleep 60"
            }
        }
        stage('Docker Images'){
            steps{
                sh "ansible-playbook -i hosts Imagepush.yml"
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
        stage('PF'){
            steps{
                sh "ansible-playbook -i hosts DeployForward.yml"
            }
        }
        }
}
