@Library('deploy-my-project') _

def dockerfileapp = 'Build-UntitTest/'
def Token_Sonar = 'Token_Sonar'
def SonarProjectKey = 'test-project'
def SonarHostUrl = 'http://54.183.97.119:9000'
def Dockerhub = 'Dockerhub'
def DockerRegistry = "amrabunemr98"
def DockerImage = "project-app"
def OpenShiftConfig = "OpenShiftConfig"
def OpenShiftProject = 'abu-nemr'

pipeline {
    agent any

    stages {
        stage('Build App and Unit Test') {
            steps {
                script {
                    BuildUnittest(dockerfileapp)
                }
            }
        }

        stage('SonarQube Analysis') {
            steps {
                script {
                    SonarQube(Token_Sonar, SonarProjectKey, SonarHostUrl)
                }
            }
        }

        stage('Build Docker image for app.py and push it to docker hub') {
            steps {
                script {
                    COMMIT_HASH = BuildPushApp(Dockerhub, DockerRegistry, DockerImage)
                }
            }
        }

        stage('Deploy to OpenShift') {
            steps {
                script {
                    COMMIT_HASH = DeployOpenShift(OpenShiftConfig, DockerRegistry, DockerImage, OpenShiftProject)
                }
            }
        }
    }
}
