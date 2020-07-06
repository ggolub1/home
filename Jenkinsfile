pipeline {
    agent any 
    stages {
        stage('Stage 1') {
            steps {
                bat "echo Hello world! : %date% : %time%"
                bat "echo %WORKSPACE%"
                bat "echo ${WORKSPACE} unix synt"
            }
        }
    }
}