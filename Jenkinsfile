pipeline {
  agent {
    docker { image 'liquibase/liquibase:4.4.3' }
  }
  stages {
    stage('Status') {
      steps {
        sh 'liquibase status --url="jdbc:postgresql://host.docker.internal:5432/testdb-1" --changeLogFile=databaseChangeLog.xml --username=postgres --password=postgres'
      }
    }
    stage('Update') {
      steps {
        sh 'liquibase update --url="jdbc:postgresql://host.docker.internal:5432/testdb-1" --changeLogFile=databaseChangeLog.xml --username=postgres --password=postgres'
      }
    }
    stage('Update Tags') {
      steps {
        sh 'liquibase tag version2 --url="jdbc:postgresql://host.docker.internal:5432/testdb-1" --username=postgres --password=postgres'
      }
    }
  }
}