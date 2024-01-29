pipeline {
    agent any

    environment {
        DOCKER_REGISTRY = "amrabunemr98"
        DOCKER_IMAGE = "test"
        imageTagApp = "build-${BUILD_NUMBER}-app"
        imageNameapp = "${DOCKER_REGISTRY}:${imageTagApp}"
        OPENSHIFT_PROJECT = 'abu-nemr'
    }

    stages {
        stage('Build and Unit Test') {
            steps {
                sh ' ./gradlew dependencies '
                sh ' ./gradlew test '

}
        }
    }
}
