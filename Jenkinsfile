pipeline {
  agent {
    docker { image 'liquibase/liquibase:4.4.3' }
  }
  stages {
    stage('Status') {
      steps {
        sh 'liquibase status --url="jdbc:postgresql://172.17.0.1:5432/testdb-1" --changeLogFile=databaseChangeLog.xml --username=postgres --password=secure_pass_here'
      }
    }
    stage('Update') {
      steps {
        sh 'liquibase update --url="jdbc:postgresql://172.17.0.1:5432/testdb-1" --changeLogFile=databaseChangeLog.xml --username=postgres --password=secure_pass_here'
      }
    }
    stage('Update Tags') {
      steps {
        sh 'liquibase tag version2 --url="jdbc:postgresql://172.17.0.1:5432/testdb-1" --username=postgres --password=secure_pass_here'
      }
    }
  }
}