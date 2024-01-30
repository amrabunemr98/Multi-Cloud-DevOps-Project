def BuildAppAndUnitTest(string dockerfileapp = 'Build-UntitTest') {
    script {
    sh "docker build -t gradle-test ${docker_file_app} ."
    }
}
