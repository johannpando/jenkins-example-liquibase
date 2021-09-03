pipeline {
  agent {
    docker { image 'liquibase/liquibase:4.4.2' }
  }
  stages {
    stage('Status') {
      steps {
        sh 'liquibase status --url="jdbc:postgresql://host.docker.internal:5432/testdb-1" --changeLogFile=databaseChangeLog.xml --username=postgres --password=secure_pass_here'
      }
    }
    stage('Update') {
      steps {
        sh 'liquibase update --url="jdbc:postgresql://host.docker.internal:5432/testdb-1" --changeLogFile=databaseChangeLog.xml --username=postgres --password=secure_pass_here'
      }
    }
    stage('Update Tags') {
      steps {
        sh 'liquibase update --url="jdbc:postgresql://host.docker.internal:5432/testdb-1" --changeLogFile=tagDatabaseLog.xml --username=postgres --password=secure_pass_here'
      }
    }
  }
}