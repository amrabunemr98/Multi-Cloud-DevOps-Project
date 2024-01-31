def call() {
    openshiftdeploy
    test
}

def getCommitHash() {
    return sh(script: 'git rev-parse --short HEAD', returnStdout: true).trim()
}


def openshiftdeploy(OpenShiftConfig, DOCKER_REGISTRY, DOCKER_IMAGE, OPENSHIFT_PROJECT ) {
    script {
    def COMMIT_HASH = getCommitHash()
    withCredentials([file(credentialsId: 'OpenShiftConfig', variable: 'OPENSHIFT_SECRET')]) {
        // Replace the placeholder with the actual Docker image in the Kubernetes YAML files
        sh "sed -i 's|image:.*|image: ${DOCKER_REGISTRY}/${DOCKER_IMAGE}:Build-${COMMIT_HASH}-APP|g' Kubernetes-Manifest/Deployment.yml"
        
        // Apply the deployment file
        sh "oc apply -f Kubernetes-Manifest -n ${OPENSHIFT_PROJECT} --kubeconfig=\$OPENSHIFT_SECRET"
        }
        return COMMIT_HASH
    }
}

def test() {
    echo "hello"
}


