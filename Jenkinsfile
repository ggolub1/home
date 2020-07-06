pipeline {
    agent any 
    stages {
        stage('Stage 1') {
            steps {
                bat "echo running batch file : %date% : %time%"
                bat "set A='c:\\tmp'"
                bat dir %A%



            }
        }
    }
}