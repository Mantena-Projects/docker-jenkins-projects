
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
    stage('Parameter') {
      steps {
	 script{
	    properties([parameters([string(defaultValue: 'dhub2000/img', name: 'REPO_NAME')]), pipelineTriggers([githubPush()])])
      }}}
    stage('Latest Image') {
      steps {
         //sh "chmod +x ./jenkins/latest-img.sh;./jenkins/latest-img.sh ${params.REPO_NAME}"
	 script {
	   def output = sh(returnStdout: true,script: "chmod +x ./jenkins/latest-img.sh;./jenkins/latest-img.sh ${params.REPO_NAME}")
	   result="${output}"
	   echo "${result}"
	 }
      }
    }
    stage('Run Container') {
      steps {
           //sh "docker run -d ${result}"
	    sh "chmod +x ./docker-compose.yml"
	    sh 'sed "s/name:tag/${params.REPO_NAME}:${result}/g" docker-compose.yml | docker-compose up -d'
	   //sh './jenkins/docker-compose up -d'
      }
    }
  }
  post {
    always {
       sh 'docker logout'
    }
  }
}
