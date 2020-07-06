pipeline {
    agent any 
    stages {
        stage('Stage 1') {
            steps {
                bat "echo running batch file : %date% : %time%"
                bat "dir %WORKSPACE%"
                bat "call %WORKSPACE%\\326a\\t4.bat"

            }
        }
    }
}