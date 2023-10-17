pipeline {

  agent any
  
  environment {

	DOCKERHUB_CREDENTIALS = credentials('padma-dockerhub')
  }

  stages {

     stage('Checkout Code From GitHub') {

          steps {

              checkout([$class: 'GitSCM', branches:[[name: '*/main']], extensions:[], userRemoteConfigs:[[url:'']]])

                }
            }

     
    stage('Build Docker Image') {

         steps {
              
             docker build -t dhub2000/docker-jenkins:1 .
              
               }
          }
  
    stage('Login to Dockerhub') {
   
         steps {

	     echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin
               }
          }

    stage('Push Image to Dockerhub') {

         steps {

             docker push dhub2000/docker-jenkins:1

               }
          }
  }


         post {

           always {
      
              docker logout

           }}
    
}
