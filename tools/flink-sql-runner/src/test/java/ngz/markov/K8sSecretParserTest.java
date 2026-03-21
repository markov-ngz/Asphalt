package ngz.markov;

import java.util.List;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.junit.jupiter.api.Assertions.assertNull;
import static org.junit.jupiter.api.Assertions.assertTrue;
import org.junit.jupiter.api.Test;

public class K8sSecretParserTest {

    @Test
    public void shouldReturnEmptyListWhenInputIsNull() {
        List<K8sSecretRef> result = K8sSecretParser.parseSecretKeyRefs(null);
        assertNotNull(result);
        assertTrue(result.isEmpty());
    }

    @Test
    public void shouldReturnEmptyListWhenInputIsBlank() {
        List<K8sSecretRef> result = K8sSecretParser.parseSecretKeyRefs("   ");
        assertNotNull(result);
        assertTrue(result.isEmpty());
    }

    @Test
    public void shouldParseSingleSecretEntry() {
        String input = "env:FOO_ENV,secret:foo_secret,key:foo_key";

        List<K8sSecretRef> result = K8sSecretParser.parseSecretKeyRefs(input);

        assertEquals(1, result.size());

        K8sSecretRef ref = result.get(0);
        assertEquals("FOO_ENV", ref.getEnv());
        assertEquals("foo_secret", ref.getSecret());
        assertEquals("foo_key", ref.getKey());
    }

    @Test
    public void shouldParseMultipleSecretEntries() {
        String input = "env:ENV1,secret:secret1,key:key1;" +
                       "env:ENV2,secret:secret2,key:key2";

        List<K8sSecretRef> result = K8sSecretParser.parseSecretKeyRefs(input);

        assertEquals(2, result.size());

        K8sSecretRef first = result.get(0);
        assertEquals("ENV1", first.getEnv());
        assertEquals("secret1", first.getSecret());
        assertEquals("key1", first.getKey());

        K8sSecretRef second = result.get(1);
        assertEquals("ENV2", second.getEnv());
        assertEquals("secret2", second.getSecret());
        assertEquals("key2", second.getKey());
    }

    @Test
    public void shouldTrimSpacesAroundEntries() {
        String input = "  env:FOO_ENV , secret:foo_secret , key:foo_key  ";

        List<K8sSecretRef> result = K8sSecretParser.parseSecretKeyRefs(input);

        assertEquals(1, result.size());

        K8sSecretRef ref = result.get(0);
        assertEquals("FOO_ENV", ref.getEnv());
        assertEquals("foo_secret", ref.getSecret());
        assertEquals("foo_key", ref.getKey());
    }

    @Test
    public void shouldHandleMissingFields() {
        String input = "env:ONLY_ENV";

        List<K8sSecretRef> result = K8sSecretParser.parseSecretKeyRefs(input);

        assertEquals(1, result.size());

        K8sSecretRef ref = result.get(0);
        assertEquals("ONLY_ENV", ref.getEnv());
        assertNull(ref.getSecret());
        assertNull(ref.getKey());
    }
}