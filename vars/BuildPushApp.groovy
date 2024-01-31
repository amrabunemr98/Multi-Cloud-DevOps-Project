def getCommitHash() {
    return sh(script: 'git rev-parse --short HEAD', returnStdout: true).trim()
}


def call(Dockerhub, DOCKER_REGISTRY, DOCKER_IMAGE) {
    script {
    def COMMIT_HASH = getCommitHash()
    withCredentials([usernamePassword(credentialsId: 'Dockerhub', usernameVariable: 'DOCKER_REGISTRY_USERNAME', passwordVariable: 'DOCKER_REGISTRY_PASSWORD')]) {
        // Authenticate with Docker Hub to push Docker image
        sh "echo \${DOCKER_REGISTRY_PASSWORD} | docker login -u \${DOCKER_REGISTRY_USERNAME} --password-stdin"
        
        // Build Docker image for app.py
        sh "docker build -t ${DOCKER_REGISTRY}:Build-${COMMIT_HASH}-APP ."

        sh "docker tag ${DOCKER_REGISTRY}:Build-${COMMIT_HASH}-APP docker.io/${DOCKER_REGISTRY}/${DOCKER_IMAGE}:Build-${COMMIT_HASH}-APP"
        
        // Push the app Docker image to Docker Hub
        sh "docker push docker.io/${DOCKER_REGISTRY}/${DOCKER_IMAGE}:Build-${COMMIT_HASH}-APP"
        
        // Remove the locally built app Docker image
        sh "docker rmi -f ${DOCKER_REGISTRY}:Build-${COMMIT_HASH}-APP"
        }
        return COMMIT_HASH
    }
}
