pipeline {
    agent any
    environment {
        DOCKER_REGISTRY = "amrabunemr98"
        DOCKER_IMAGE = "test"
        imageTagApp = "build-${BUILD_NUMBER}-app"
        imageNameapp = "${DOCKER_REGISTRY}:${imageTagApp}"
        OPENSHIFT_PROJECT = 'abu-nemr'
        docker_file_app = 'Build-UntitTest/Dockerfile'

    }

    stages {
        stage('Build and Unit Test') {
            steps {
                sh ' docker build -t gradle-test ${docker_file_app} '

}
        }
    }
}
