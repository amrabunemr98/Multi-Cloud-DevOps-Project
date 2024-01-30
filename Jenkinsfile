@Library('deploy-my-project') _
pipeline {
    agent any
    environment {
        DOCKER_REGISTRY = "amrabunemr98"
        DOCKER_IMAGE = "Project-APP"
        OPENSHIFT_PROJECT = 'abu-nemr'
        docker_file_app = 'Build-UntitTest/'
        SONAR_PROJECT_KEY = 'test-project'
        SONAR_HOST_URL = 'http://54.183.182.49:9000'
        SONAR_SCANNER_HOME = tool 'SonarQube'


    }

    stages {

        stage('Build App and Unit Test') {
            steps {
                script{
                   BuildAppAndUnitTest.BuildAppAndUnitTest(string docker_file_app)
                }
            }
        }

        stage('SonarQube Analysis') {
            steps {
                script {
                    SonarQube.sonarqube(string Token_Sonar, string SONAR_SCANNER_HOME, string SONAR_PROJECT_KEY, string SONAR_HOST_URL)
                    }                
                }
                
            }
        stage('Build Docker image for app.py and push it to docker hub') {
            steps {
                script{
                    COMMIT_HASH = BuildandPushDockerImage.BuildandPushDockerImage(string Dockerhub, string DOCKER_REGISTRY, string DOCKER_IMAGE)
                }
                }
            }

        stage('Deploy to OpenShift') {
            steps {
                script {
                    COMMIT_HASH = DeployOpenShift.DeployonOpenShift(string OpenShiftConfig, string DOCKER_REGISTRY, string DOCKER_IMAGE, string OPENSHIFT_PROJECT )
                }
            }
        }

    }
}




