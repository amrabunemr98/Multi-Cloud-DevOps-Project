def BuildAppAndUnitTest(docker_file_app) {
    script {
    sh "docker build -t gradle-test ${docker_file_app} ."
    }
}
