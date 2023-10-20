pipeline {
   agent any
   stages {
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
            sh "docker run -d ${result}"
	    //sh "chmod +x ./docker-compose.yml"
	    //sh 'sed "s/repo/image:tag/dhub2000/img:93/g" docker-compose.yml | sudo docker-compose up -d'
	   //sh './jenkins/docker-compose up -d'
      }
    }
}
}
