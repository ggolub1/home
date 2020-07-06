pipeline {
    agent any 
    stages {
        stage('Stage 1') {
            steps {
                sh "echo running batch file : %date% : %time%"
                sh "set A='c:\\tmp'"
                sh dir %A%



            }
        }
    }
}