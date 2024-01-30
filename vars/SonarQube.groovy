def call() {}


def sonarqube(string Token_Sonar, string SONAR_SCANNER_HOME, string SONAR_PROJECT_KEY, string SONAR_HOST_URL) {
    script{
        withCredentials([string(credentialsId: 'Token_Sonar', variable: 'SONAR_TOKEN')]) {
        // Run SonarQube analysis with the token
        sh "${SONAR_SCANNER_HOME}/bin/sonar-scanner -X -Dsonar.projectKey=${SONAR_PROJECT_KEY} -Dsonar.host.url=${SONAR_HOST_URL} -Dsonar.login=${SONAR_TOKEN} -Dsonar.scm.provider=git -Dsonar.java.binaries=build/classes" 
        }
    }
}