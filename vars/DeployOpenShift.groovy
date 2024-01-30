def getCommitHash() {
    return sh(script: 'git rev-parse --short HEAD', returnStdout: true).trim()
}


def DeployonOpenShift(string OpenShiftConfig, string DOCKER_REGISTRY, string DOCKER_IMAGE, string OPENSHIFT_PROJECT ) {
    script {
    def COMMIT_HASH = getCommitHash()
    withCredentials([file(credentialsId: 'OpenShiftConfig', variable: 'OPENSHIFT_SECRET')]) {
        // Download and install OpenShift Client Tools
        def ocHome = tool 'openshift'
        env.PATH = "${ocHome}/:${env.PATH}"  
        // Replace the placeholder with the actual Docker image in the Kubernetes YAML files
        sh "sed -i 's|image:.*|image: ${DOCKER_REGISTRY}/${DOCKER_IMAGE}:Build-${COMMIT_HASH}-APP|g' ./deployment.yml"
        
        // Apply the deployment file
        sh "oc apply -f deployment.yml -n ${OPENSHIFT_PROJECT} --kubeconfig=\$OPENSHIFT_SECRET"
        }
        return COMMIT_HASH
    }
}