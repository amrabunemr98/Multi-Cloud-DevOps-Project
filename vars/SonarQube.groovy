def call(Token_Sonar, SONAR_PROJECT_KEY, SONAR_HOST_URL) {
    script {
        withCredentials([string(credentialsId: 'Token_Sonar', variable: 'SONAR_TOKEN')]) {
            // This assumes that the SonarQube Scanner tool is configured in the Jenkins Global Tool Configuration.
            def scannerHome = tool 'SonarQube'   // Retrieve the installation path of the SonarQube Scanner tool defined in Jenkins.
            sh """
                ${scannerHome}/bin/sonar-scanner \
                -X \
                -Dsonar.projectKey=${SONAR_PROJECT_KEY} \
                -Dsonar.host.url=${SONAR_HOST_URL} \
                -Dsonar.login=${SONAR_TOKEN} \
                -Dsonar.scm.provider=git \
                -Dsonar.java.binaries=build/classes
            """
        }
    }
}
