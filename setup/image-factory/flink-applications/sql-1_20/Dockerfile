FROM flink:1.20.3-java17

# For the deps becareful to download fat jar : https://nightlies.apache.org/flink/flink-cdc-docs-release-3.5/docs/faq/faq/#q2-when-should-i-use-flink-sql-connector-xxx-jar-when-should-i--flink-connector-xxx-jar-whats-the-difference-between-the-two
# All layers here are just to explicit the dependencies otherwise , just combine to one step 
COPY flink-json-1.20.3.jar $FLINK_HOME/lib/
COPY flink-sql-connector-kafka-3.4.0-1.20.jar $FLINK_HOME/lib/
COPY flink-sql-connector-postgres-cdc-3.5.0.jar $FLINK_HOME/lib/

# Postgres Sink test connector
COPY flink-connector-jdbc-3.3.0-1.20.jar $FLINK_HOME/lib/
COPY postgresql-42.7.10.jar $FLINK_HOME/lib/

# ADD instead of COPY to unzip the tar.gz 
ADD flink-cdc-3.5.0-bin.tar.gz $FLINK_HOME/
RUN mv "$FLINK_HOME/flink-cdc-3.5.0/lib/flink-cdc-dist-3.5.0.jar" "$FLINK_HOME/lib/"

# App to directly copy sql file and run the flink job 
ARG SQL_RUNNER_JAR
COPY $SQL_RUNNER_JAR $FLINK_HOME/usrlib/app.jar

# sql Statement
ARG SQL_FILE
COPY $SQL_FILE $FLINK_HOME/usrlib/sql/statement.sql