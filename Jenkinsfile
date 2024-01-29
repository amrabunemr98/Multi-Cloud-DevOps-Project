pipeline {
    agent any
    environment {
        DOCKER_REGISTRY = "amrabunemr98"
        DOCKER_IMAGE = "test"
        imageTagApp = "build-${BUILD_NUMBER}-app"
        imageNameapp = "${DOCKER_REGISTRY}:${imageTagApp}"
        OPENSHIFT_PROJECT = 'abu-nemr'
        docker_file_app = 'Build-UntitTest/'
        SONAR_PROJECT_KEY = 'test-project'
        SONAR_HOST_URL = 'http://54.193.207.61:9000/projects'
        SONAR_TOKEN = 'squ_49ecf46a93d4ca3e7fdb60b0cd80bf31895b6fa8'

    }

    stages {
        stage('Build and Unit Test') {
            steps {
                sh ' docker build -t gradle-test ${docker_file_app} '

            }
        }
        stage('Build and Unit Test') {
            steps {
                    withSonarQubeEnv('SonarQube') {
                        // Run SonarQube analysis
                        sh "./gradlew sonar -Dsonar.projectKey=${SONAR_PROJECT_KEY} -Dsonar.host.url=${SONAR_HOST_URL} -Dsonar.login=${SONAR_TOKEN} -Dsonar.scm.provider=git"
                    }
            }
        }
    }
}
