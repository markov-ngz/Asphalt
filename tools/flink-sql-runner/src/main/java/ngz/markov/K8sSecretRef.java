package ngz.markov ; 

public class K8sSecretRef {
    private final String env;
    private final String secret;
    private final String key;

    public K8sSecretRef(String env, String secret, String key) {
        this.env = env;
        this.secret = secret;
        this.key = key;
    }

    public String getEnv() { return env; }
    public String getSecret() { return secret; }
    public String getKey() { return key; }

    @Override
    public String toString() {
        return "K8sSecretRef{" +
                "env='" + env + '\'' +
                ", secret='" + secret + '\'' +
                ", key='" + key + '\'' +
                '}';
    }
}