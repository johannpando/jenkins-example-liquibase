pipeline {
  agent {
    docker { image 'liquibase/liquibase:4.4.3' }
  }
  stages {
    stage('Status') {
      steps {
        sh 'liquibase status --url="jdbc:postgresql://localhost:5432/testdb" --changeLogFile=databaseChangeLog.xml --username=postgres --password=postgres'
      }
    }
    stage('Update') {
      steps {
        sh 'liquibase update --url="jdbc:postgresql://localhost:5432/testdb" --changeLogFile=databaseChangeLog.xml --username=postgres --password=postgres'
      }
    }
    stage('Update Tags') {
      steps {
        sh 'liquibase tag version2 --url="jdbc:postgresql://localhost:5432/testdb" --username=postgres --password=postgres'
      }
    }
  }
}