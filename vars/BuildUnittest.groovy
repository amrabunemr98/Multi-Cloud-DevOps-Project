def call(dockerfileapp) {
    script {
    sh "docker build -t gradle-test ${dockerfileapp} ."
    }
}