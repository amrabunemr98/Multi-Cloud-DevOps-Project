def BuildAppAndUnitTest(dockerfileapp) {
    script {
    sh "docker build -t gradle-test ${dockerfileapp} ."
    }
}
