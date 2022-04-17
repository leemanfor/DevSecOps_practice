pipeline {
    agent {label 'jenkins-agent'}
    options {
        // Include timestamps on all output for verbosity
        timestamps()
        
        // Discards old builds after this date
        buildDiscarder(logRotator(daysToKeepStr: '5', numToKeepStr: '100'))

        // Set timeout so job doesn't run forever
        timeout(time: 15, unit 'MINUTES')

        // Disable concurrent jobs from running
        disableConcurentBuilds()

    environment {
        // Set Dockerhub login credentials using a variable passed through into Jenkins using Credential manager.
        DOCKERHUB_LOGIN=credentials('dockerhub-kharnden')
    }
    stages {
        stage('Build')
            steps{
                sh 'cd /scratch/docker_apache/ && docker build apache:1.0 .'
                sh 'docker tag apache:1.0 kharnden/apache:1.0'
            }
        stage("Run")
            steps {
                sh 'docker run -p 80:2100 -p 443:2200 apache:1.0'
            }
        stage("Test - SSL")
            steps { 
                sh 'docker exec apache:1.0 | openssl s_client -showcerts -connect https://<hostname>'
            }
        stage("Test - Port")
            steps {
                // Curl will return non 0 if connection fails
                  sh 'docker exec docker exec apache:1.0 | curl <hostname>:443'
        stage("Push")
            steps {
                sh 'echo $DOCKERHUB_PASS | docker login -u $dockerhub_user --password stdin'
                sh 'docker push kharnden/apache:1.0'
            }
    }




















}
