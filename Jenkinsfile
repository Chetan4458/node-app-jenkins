pipeline {
    agent any
 
    stages {
        stage('Build') {
            steps {
                script {
                    // Build the Docker image with the tag 'latest'
                    docker.build('my-app:latest')
                }
            }
        }
 
        
 
        stage('Deploy') {
            steps {
                script {
                    // Define the target image tag for the Docker registry
                    def targetImage = 'chetan311/node-app'
                    // Tag the built image with the target repository path and tag
                    sh "docker tag my-app:latest ${targetImage}"
                    // Log in to Docker Hub (Ensure you have Docker Hub credentials configured)
                    withDockerRegistry([credentialsId: 'dockerhub', url: 'https://index.docker.io/v1/']) {
                        // Push the tagged image to the Docker registry
                        sh "docker push ${targetImage}"
                    }
                }
            }
        }
    }
    // Cleanup workspace after the pipeline run
    post {
        always {
            deleteDir()
        }
    }
}
