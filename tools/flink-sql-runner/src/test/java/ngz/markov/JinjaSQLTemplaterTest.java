package ngz.markov ;

import java.util.HashMap;
import java.util.Map;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertFalse;
import static org.junit.jupiter.api.Assertions.assertTrue;
import org.junit.jupiter.api.Test;

public class JinjaSQLTemplaterTest {

    private static final String REGEX = "^jinja\\.args\\.(?:secret\\.)?(.+)$";

    @Test
    public void shouldExtractSimpleArgs() {
        Map<String, String> input = new HashMap<>();
        input.put("jinja.args.username", "john");

        Map<String, String> result =
                JinjaSQLTemplater.parseJinjaParams(input, REGEX);

        assertEquals(1, result.size());
        assertEquals("john", result.get("username"));
    }

    @Test
    public void shouldExtractSecretArgs() {
        Map<String, String> input = new HashMap<>();
        input.put("jinja.args.secret.password", "1234");

        Map<String, String> result =
                JinjaSQLTemplater.parseJinjaParams(input, REGEX);

        assertEquals(1, result.size());
        assertEquals("1234", result.get("password"));
    }

    @Test
    public void shouldExtractMultipleArgs() {
        Map<String, String> input = new HashMap<>();
        input.put("jinja.args.user", "alice");
        input.put("jinja.args.secret.token", "xyz");
        input.put("other.key", "ignore");

        Map<String, String> result =
                JinjaSQLTemplater.parseJinjaParams(input, REGEX);

        assertEquals(2, result.size());
        assertEquals("alice", result.get("user"));
        assertEquals("xyz", result.get("token"));
        assertFalse(result.containsKey("other.key"));
    }

    @Test
    public void shouldNotMatchInvalidPrefixes() {
        Map<String, String> input = new HashMap<>();
        input.put("jinja.arg.username", "wrong");
        input.put("jinja.argssecret.password", "wrong");
        input.put("jinja.args.", "empty");

        Map<String, String> result =
                JinjaSQLTemplater.parseJinjaParams(input, REGEX);

        assertTrue(result.isEmpty());
    }

    @Test
    public void shouldHandleNestedKeys() {
        Map<String, String> input = new HashMap<>();
        input.put("jinja.args.secret.db.password", "pass");

        Map<String, String> result =
                JinjaSQLTemplater.parseJinjaParams(input, REGEX);

        assertEquals(1, result.size());
        assertEquals("pass", result.get("db.password"));
    }
}