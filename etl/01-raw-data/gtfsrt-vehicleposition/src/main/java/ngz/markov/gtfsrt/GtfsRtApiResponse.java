package ngz.markov.gtfsrt ;

import java.io.Serializable;

public class GtfsRtApiResponse implements Serializable {
    private final byte[] protobufData;
    private final String requestId;
    private final long fetchTimestamp;
    
    public GtfsRtApiResponse(byte[] protobufData, String requestId, long fetchTimestamp) {
        this.protobufData = protobufData;
        this.requestId = requestId;
        this.fetchTimestamp = fetchTimestamp;
    }
    
    public byte[] getProtobufData() {
        return protobufData;
    }
    
    public String getRequestId() {
        return requestId;
    }
    
    public long getFetchTimestamp() {
        return fetchTimestamp;
    }
}
