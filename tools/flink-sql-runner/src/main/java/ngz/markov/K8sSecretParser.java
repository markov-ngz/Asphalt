package ngz.markov ;

import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class K8sSecretParser {

     private static final Logger LOG = LoggerFactory.getLogger(K8sSecretParser.class);
    /**
     * Map a string to K8sSecretRef
     * Expected format is defined as : 
     *  env:FOO_ENV,secret:foo_secret,key:foo_key
     * doc : https://nightlies.apache.org/flink/flink-docs-stable/docs/deployment/config/#kubernetes-env-secretkeyref
     */
    public static List<K8sSecretRef> parseSecretKeyRefs(String secretsEnv){

        LOG.info("Secrets Env to parse : {}",secretsEnv) ; 

        if (secretsEnv == null || secretsEnv.isBlank()) {
            LOG.info("No k8s secrets env to find at : {}",secretsEnv) ; 
            return Collections.emptyList();
        }

        return Arrays.stream(secretsEnv.split(";"))
                .map(String::trim)
                .filter(s -> !s.isEmpty())
                .map(entry -> parseK8sSecretEntry(entry))
                .collect(Collectors.toList());
    }

    private static K8sSecretRef parseK8sSecretEntry(String entry) {
        LOG.info("Parsing entry: {}",entry) ; 
        Map<String, String> values = Arrays.stream(entry.split(","))
                .map(String::trim)
                .map(kv -> kv.split(":", 2))
                .collect(Collectors.toMap(
                        kv -> kv[0].trim(),
                        kv -> kv[1].trim()
                ));

        return new K8sSecretRef(
                values.get("env"),
                values.get("secret"),
                values.get("key")
        );
    }
}
