@Library('deploy-my-project') _
def docker-file-app = './Build-UntitTest/'
def Token_Sonar = 'Token_Sonar'
def SONAR-SCANNER-HOME = 'tool 'SonarQube''
def SONAR-PROJECT-KEY = 'test-project'
def SONAR-HOST-URL = 'http://54.183.182.49:9000'
def Dockerhub = 'Dockerhub'
def DOCKER-REGISTRY = "amrabunemr98"
def DOCKER-IMAGE = "Project-APP"
def OpenShiftConfig = "OpenShiftConfig"
def OPENSHIFT-PROJECT = 'abu-nemr'


pipeline {
    agent any

    stages {

        stage('Build App and Unit Test') {
            steps {
                script{
                   BuildAppAndUnitTest.BuildAppAndUnitTest(docker-file-app)
                }
            }
        }

        stage('SonarQube Analysis') {
            steps {
                script {
                    SonarQube.sonarqube(Token_Sonar, SONAR-SCANNER-HOME, SONAR-PROJECT-KEY, SONAR_HOST_URL)
                    }                
                }
                
            }
        stage('Build Docker image for app.py and push it to docker hub') {
            steps {
                script{
                    COMMIT_HASH = BuildandPushDockerImage.BuildandPushDockerImage(Dockerhub, DOCKER-REGISTRY, DOCKER-IMAGE)
                }
                }
            }

        stage('Deploy to OpenShift') {
            steps {
                script {
                    COMMIT_HASH = DeployOpenShift.DeployonOpenShift(OpenShiftConfig, DOCKER-REGISTRY, DOCKER-IMAGE, OPENSHIFT-PROJECT )
                }
            }
        }

    }
}




