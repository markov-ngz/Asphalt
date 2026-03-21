package ngz.markov ; 

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.apache.flink.util.FileUtils;

import com.hubspot.jinjava.Jinjava;

public class JinjaSQLTemplater {
    
    public static List<String> renderSQLStatements(
            String sqlFilePath ,
            Map<String,String> jinjaArgs , 
            String statementDelimiter 
        )throws IOException{
        
        Jinjava jinjava = new Jinjava() ; 

        String sqlScript = FileUtils.readFileUtf8(new File(sqlFilePath)).trim();

        String[] rawStatements = sqlScript.split(statementDelimiter) ; 

        List<String> statements = new ArrayList<>() ; 
        
        for(String rawStatement : rawStatements){
            String statement = jinjava.render(rawStatement, jinjaArgs) ; 
            statements.add(statement) ; 
        }

        return statements ; 
        
    }

    public static Map<String,String> parseJinjaParams(Map<String,String> params , String jinjaArgsRegex){

        // Compile the regex expression
        Pattern pattern = Pattern.compile(jinjaArgsRegex);
        // Container to put the args 
        Map<String,String> jinjaArgs = new HashMap<>() ; 

        // For each if the key starts with 'jinja.' , get the last part after 'jinja.' and append 
        params.forEach((k , v )-> {
                    
            Matcher matcher = pattern.matcher(k);

            if(matcher.matches()){
               String jinjaKey = matcher.group(1) ; 
               jinjaArgs.put(jinjaKey, v ) ; 
            }
        });

        return jinjaArgs ; 
    }

    public static Map<String,String> parseJinjaFromK8sSecrets(List<K8sSecretRef> secrets , String jinjaEnvPrefix) throws IllegalArgumentException{
        
        Map<String,String> jinjaArgs = new HashMap<>() ;
        
        secrets.forEach(secret -> {
            if(secret.getEnv().startsWith(jinjaEnvPrefix)){
                // Remove prefix 
                String jinjaKey = secret.getEnv().replace(jinjaEnvPrefix, "").toLowerCase() ; 
                String jinjaValue = System.getenv(secret.getEnv()) ; 

                if(jinjaValue.isEmpty()){
                    throw new IllegalArgumentException("Environment Value %s not found".formatted(secret.getEnv())) ; 
                }
                
                jinjaArgs.put(jinjaKey, jinjaValue) ; 
            }
        });

        return jinjaArgs ; 
    }
}
