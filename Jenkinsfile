def awsCredentials = [[$class: 'AmazonWebServicesCredentialsBinding', credentialsId: 'aws-cdk-setup']]

pipeline {
    agent {
         dockerfile true
    }
    environment {
        AWS_REGION = 'eu-west-1'
        HOME = '.'
    }
    options {
        disableConcurrentBuilds()
        parallelsAlwaysFailFast()
        timestamps()
        withCredentials(awsCredentials)
    }
    stages {
          stage('Build') {
            steps {
              git 'clone https://github.com/rakeshbuggaveeti/project-cdk.git'
            }
          }
          stage('Deploy') {
            steps {
              sh 'cdk deploy --require-approval=never'
            }
          }

          stage('Destroy') {
            steps {
              sh 'cdk destroy --require-approval=never'
            }
          }
    }
    
    post {
      always {
        cleanWs()
      }
    }
}