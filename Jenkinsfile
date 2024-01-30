@Library('deploy-my-project') _

def dockerfileapp = 'Build-UntitTest/'
def Token_Sonar = 'Token_Sonar'
def SonarScannerHome = 'SonarQube' // Assuming 'SonarQube' is the tool name
def SonarProjectKey = 'test-project'
def SonarHostUrl = 'http://54.183.182.49:9000'
def Dockerhub = 'Dockerhub'
def DockerRegistry = "amrabunemr98"
def DockerImage = "Project-APP"
def OpenShiftConfig = "OpenShiftConfig"
def OpenShiftProject = 'abu-nemr'

pipeline {
    agent any

    stages {
        stage('Build App and Unit Test') {
            steps {
                script {
                    node {
                        def COMMIT_HASH = BuildAppAndUnitTest.BuildAppAndUnitTest(dockerfileapp)
                        echo "Commit Hash: ${COMMIT_HASH}"
                    }
                }
            }
        }

        stage('SonarQube Analysis') {
            steps {
                script {
                    node {
                        SonarQube.sonarqube(Token_Sonar, SonarScannerHome, SonarProjectKey, SonarHostUrl)
                    }
                }
            }
        }

        stage('Build Docker image for app.py and push it to docker hub') {
            steps {
                script {
                    node {
                        def COMMIT_HASH = BuildandPushDockerImage.BuildandPushDockerImage(Dockerhub, DockerRegistry, DockerImage)
                        echo "Commit Hash: ${COMMIT_HASH}"
                    }
                }
            }
        }

        stage('Deploy to OpenShift') {
            steps {
                script {
                    node {
                        def COMMIT_HASH = DeployOpenShift.DeployonOpenShift(OpenShiftConfig, DockerRegistry, DockerImage, OpenShiftProject)
                        echo "Commit Hash: ${COMMIT_HASH}"
                    }
                }
            }
        }
    }
}
