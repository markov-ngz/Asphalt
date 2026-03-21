package ngz.markov.cdc.model ; 

import org.apache.flink.types.RowKind;

import lombok.Data;

@Data
public class CDCEvent<T> {
 
    private String databaseName;
    private String schema;
    private String table;
    private long recordTimestamp;
    private RowKind rowKind;
    private String jsonObject;
    private T object ;


    /**
    *  Allow to set the row kind from op and rowKind to have a proper Row Kind.<br>
    *  The rowkind and operations can't be trusted hence we combine information from both values
    */
    public void setRowKind(String op , String rowKind){
        switch (rowKind){
            case "+I"->
                
                this.rowKind = op.equals("d") ? RowKind.DELETE : RowKind.INSERT ;
            case "-D"->
                this.rowKind = RowKind.DELETE ; 
            case "-U"->
                this.rowKind = RowKind.UPDATE_BEFORE ; 
            case "+U"->
                this.rowKind =  op.equals("c") ? RowKind.UPDATE_AFTER : RowKind.UPDATE_BEFORE ; 
            default -> 
                throw new UnsupportedOperationException(
                        String.format(
                                "Unsupported operation '%s' for row kind.",
                                rowKind));
        }
            
    }
}
