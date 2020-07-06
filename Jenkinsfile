pipeline {
    agent any 
    stages {
        stage('Stage 1') {
            steps {
                bat "echo running batch file : %date% : %time%"
                bat "A=c:\\tmp"
                bat "ls ${A}"



            }
        }
    }
}