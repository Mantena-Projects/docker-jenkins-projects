
pipeline {
  agent any
  environment {
    DOCKERHUB_CREDENTIALS = credentials('padma-dockerhub')
  }
  stages {
    stage('Build') {
      steps {
	    docker build -t dhub2000/docerimg:1 .
      }
    }
    stage('Login') {
      steps {
         echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin
      }
    }
    stage('Push') {
      steps {
         docker push dhub2000/dockerimg:1
      }
    }
  }
  post {
    always {
       docker logout
    }
  }
}
