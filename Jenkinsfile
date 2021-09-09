pipeline{
    agent any
    tools{
        maven 'Maven_home'
    }
    stages{
        stage('Checkout SCM'){
            steps{
                git url: 'https://github.com/kaushik12499/example-voting-app.git'
            }
        }
        stage('Prebuild'){
            steps{
                sh 'mvn clean install package'
                sh 'docker-compose build'
                sh 'docker-compose up -d'
            }
        }  
        stage('Build'){
            steps{
                sh 'mvn clean install package'
                sh 'docker-compose build'
                sh 'docker-compose up -d'
            }
        } 
        stage('Build'){
            steps{
                sh 'mvn clean install package'
                sh 'docker-compose build'
                sh 'docker-compose up -d'
            }
        }
    }
}
