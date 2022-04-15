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
    }
    triggers {
        cron('H/60 * * * *')
    }
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
        stage("Test")
            steps { 

            }
        stage("Push")
            steps {
                sh 'echo $DOCKERHUB_PASS | docker login -u $dockerhub_user --password stdin'
                sh 'docker push kharnden/apache:1.0'
            }
    }




















}