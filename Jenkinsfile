pipeline {
    agent any 
    stages {
        stage('Stage 1') {
            steps {
                sh "echo Hello world! : %date% : %time%"
                sh "echo %WORKSPACE%"
                sh "echo ${WORKSPACE} unix synt"
            }
        }
    }
}