pipeline {
    agent any 
    stages {
        stage('Stage 1') {
            steps {
                bat "echo running batch file : %date% : %time%"
                bat "%WORKSPACE%\326a\t4.bat"

            }
        }
    }
}