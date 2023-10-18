
pipeline {
  agent any
  environment {
    DOCKERHUB_CREDENTIALS = credentials('padma-dockerhub')
  }
  stages {
    stage('Build') {
      steps {
	    sh 'docker build -t dhub2000/img:$BUILD_NUMBER .'
      }
    }
    stage('Login') {
      steps {
         sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
      }
    }
    stage('Push') {
      steps {
         sh 'docker push dhub2000/img:$BUILD_NUMBER'
      }
    }
    stage('Latest Image') {
      steps {
         sh './jenkins/latest-img.sh $REPO_NAME'
      }
    }
  }
  post {
    always {
       sh 'docker logout'
    }
  }
}
