pipeline {
    agent any 
	stages {
        stage('Stage 1') {
						steps {
	                bat "echo running batch file : %date% : %time%"
	                bat "dir \"${env.WORKSPACE}\""
                	/* bat "call \"${env.WORKSPACE}\"\\326a\\t4.bat"	 */
                	bat "sqlcmd -S l390 -U gene -P gene -i \"${env.WORKSPACE}\"\\326A\\t4.txt"
            }
        }
        stage('Stage 2') {
						steps {
	                bat "echo running stage 222"

            }
        }

       
    }
}