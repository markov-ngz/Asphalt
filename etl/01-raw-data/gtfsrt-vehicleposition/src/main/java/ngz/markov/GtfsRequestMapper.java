package ngz.markov; 

import org.apache.flink.api.common.functions.OpenContext;
import org.apache.flink.api.common.functions.RichMapFunction;

import ngz.markov.gtfsrt.GtfsRtApiClient;
import ngz.markov.gtfsrt.GtfsRtApiResponse;

public class GtfsRequestMapper extends RichMapFunction<Long, GtfsRtApiResponse> {

    private final String url;

    // Must NOT be serialized
    private transient GtfsRtApiClient client;

    public GtfsRequestMapper(String url) {
        this.url = url;
    }

    @Override
    public void open(OpenContext openContext) {
        // Called once per task on the TaskManager
        this.client = new GtfsRtApiClient();
    }

    @Override
    public GtfsRtApiResponse map(Long value) throws Exception {
        return client.fetchData(url);
    }
}
