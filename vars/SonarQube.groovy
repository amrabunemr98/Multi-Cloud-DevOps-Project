def call(Token_Sonar, SONAR_PROJECT_KEY, SONAR_HOST_URL) {
    script{
        withCredentials([string(credentialsId: 'Token_Sonar', variable: 'SONAR_TOKEN')]) {
        // Run SonarQube analysis with the token 
        def scannerHome = tool 'SonarQube'
        sh "${scannerHome}/bin/sonar-scanner -X -Dsonar.projectKey=${SONAR_PROJECT_KEY} -Dsonar.host.url=${SONAR_HOST_URL} -Dsonar.login=${SONAR_TOKEN} -Dsonar.scm.provider=git -Dsonar.java.binaries=./build/classes/java/main" 
        }
    }
}
