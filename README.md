# jenkins-example-liquibase
sh 'liquibase --url="jdbc:postgresql://host.docker.internal:5432/testdb-1" --changeLogFile=rollBackChangeLog.xml --username=postgres --password=secure_pass_here rollback version1'