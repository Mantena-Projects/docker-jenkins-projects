
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
    stage('Trigger Deploy Job') {
      steps {
         build job: 'Docker_Deploy_Pipeline', parameters: [string(name: 'REPO_NAME', value: '')]
      }
    }
    
  }
  post {
    always {
       sh 'docker logout'
    }
  }
}
