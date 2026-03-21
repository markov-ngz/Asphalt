FROM flink:1.20.3-java17

# ADD instead of COPY to unzip the tar.gz 
ADD flink-cdc-3.5.0-bin.tar.gz $FLINK_HOME/
RUN mv "$FLINK_HOME/flink-cdc-3.5.0/lib/flink-cdc-dist-3.5.0.jar" "$FLINK_HOME/lib/"

COPY ./lib/ $FLINK_HOME/lib/

COPY ./usrlib/ $FLINK_HOME/usrlib/

