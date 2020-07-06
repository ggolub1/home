pipeline {
    agent any 
    stages {
        stage('Stage 1') {
            steps {
                sh "echo running batch file : %date% : %time%"
                sh "A='c:\\tmp'"
                sh "ls %{A}"



            }
        }
    }
}