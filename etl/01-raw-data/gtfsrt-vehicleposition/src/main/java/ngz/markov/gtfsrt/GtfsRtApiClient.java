package ngz.markov.gtfsrt;

import java.io.IOException;
import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URI;
import java.net.URISyntaxException;
import java.net.URL;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class GtfsRtApiClient {
    private static final Logger LOG = LoggerFactory.getLogger(GtfsRtApiClient.class);
    private static final int CONNECT_TIMEOUT_MS = 10000;
    private static final int READ_TIMEOUT_MS = 30000;
    
    public GtfsRtApiResponse fetchData(String apiUrl) throws IOException, MalformedURLException, URISyntaxException {
        LOG.info("Fetching data from API: {}", apiUrl);
        
        URL url = new URI(apiUrl).toURL();

        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        
        try {
            conn.setRequestMethod("GET");
            conn.setConnectTimeout(CONNECT_TIMEOUT_MS);
            conn.setReadTimeout(READ_TIMEOUT_MS);
            conn.setRequestProperty("Accept", "application/x-protobuf");
            
            int responseCode = conn.getResponseCode();
            if (responseCode != HttpURLConnection.HTTP_OK) {
                throw new IOException("HTTP error code: " + responseCode);
            }
            
            String requestId = conn.getHeaderField("x-request-id");
            LOG.info("API response received with x-request-id: {}", requestId);
            
            byte[] data = readAllBytes(conn.getInputStream());
            long timestamp = System.currentTimeMillis();
            
            return new GtfsRtApiResponse(data, requestId, timestamp);
            
        } finally {
            conn.disconnect();
        }
    }
    
    private byte[] readAllBytes(InputStream inputStream) throws IOException {
        byte[] buffer = new byte[8192];
        int bytesRead;
        java.io.ByteArrayOutputStream output = new java.io.ByteArrayOutputStream();
        
        while ((bytesRead = inputStream.read(buffer)) != -1) {
            output.write(buffer, 0, bytesRead);
        }
        
        return output.toByteArray();
    }
}
