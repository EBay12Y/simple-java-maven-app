pipeline {
    agent {
        docker {
            image 'maven:3.9.0-eclipse-temurin-11'
            args '-v /root/.m2:/root/.m2'
        }
    }
    options {
        skipStagesAfterUnstable()
    }
    stages {
        stage('Build') {
            steps {
                sh 'mvn -B -DskipTests clean package'
            }
        }
        stage('Test') {
            steps {
                sh 'mvn test'
            }
            post {
                always {
                    junit 'target/surefire-reports/*.xml'
                }
            }
        }
        stage('Manual Approval') {
            steps {
                input message: 'Lanjutkan ke tahap Deploy?', ok: 'Proceed', submitter: 'user'
            }
        }
        stage('Deploy') { 
            when {
                expression {
                    return currentBuild.result != 'ABORTED'
                }
            }
            steps {
                sh './jenkins/scripts/deploy.sh' 
                sleep 60 // Menjeda eksekusi selama 1 menit (60 detik)
                sh './jenkins/scripts/kill.sh' 
            }
        }
    }
}
