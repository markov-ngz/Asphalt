package ngz.markov;

import java.util.List;
import java.util.Map;

import org.apache.flink.api.java.utils.ParameterTool;
import org.apache.flink.configuration.Configuration;
import org.apache.flink.table.api.TableEnvironment;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;


public class TableAPIStreamJob {

    // get value for k8s secret beginning by JINJA_
    private static final String JINJA_ENV_PREFIX = "JINJA_" ;
    // get flink args with like jinja.args.<value> or jinja.args.secrets.<value>
    private static final String JINJA_ARGS_REGEX_PREFIX = "^jinja\\.args\\.(?:secrets\\.)?(.+)$";
    // delimiter for sql statement submittted 
    private static final String STATEMENT_DELIMITER = ";"; 

    private static final Logger LOG = LoggerFactory.getLogger(TableAPIStreamJob.class);
    
	public static void main(String[] args) throws Exception {

        // Load Configurations
        ParameterTool params = ParameterTool.fromArgs(args) ; 

        String sqlFilePath = params.getRequired("sql.filepath") ;
        String k8sSecretsEnv =  params.get("kubernetes.env.secretKeyRef");

        
        // Fill the jinja parameters from : secrets + props 
        Map<String,String> jinjaArgs = JinjaSQLTemplater.parseJinjaParams(params.toMap() , JINJA_ARGS_REGEX_PREFIX) ;

        
        
        if(k8sSecretsEnv != null ){

            List<K8sSecretRef> k8sSecretsEnvs = K8sSecretParser.parseSecretKeyRefs(k8sSecretsEnv) ; 

            Map<String,String> jinjaArgsSecrets = JinjaSQLTemplater.parseJinjaFromK8sSecrets(k8sSecretsEnvs, JINJA_ENV_PREFIX) ; 
            jinjaArgs.putAll(jinjaArgsSecrets);

        } else {
            LOG.warn("No value for kubernetes.env.secretKeyRef provided");
        }

        // Extract the statements from  the given file path
        List<String> renderedStatements = JinjaSQLTemplater.renderSQLStatements(sqlFilePath, jinjaArgs, STATEMENT_DELIMITER) ; 
        
        TableEnvironment tableEnv = TableEnvironment.create(new Configuration()) ; 
        
        renderedStatements.forEach(renderedStatement -> {
            tableEnv.executeSql(renderedStatement);
        });

        

	}
}
